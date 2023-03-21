import 'package:balanstate_test02/database/drift_database.dart';
import 'package:balanstate_test02/screen/mealinformation_screen_barcode.dart';
import 'package:balanstate_test02/screen/mealinformation_screen_name.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get_it/get_it.dart';
import 'package:openfoodfacts/model/Nutrient.dart';
import 'package:openfoodfacts/model/PerSize.dart';
import 'package:openfoodfacts/model/parameter/SearchTerms.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class InputMealScreen extends StatefulWidget {
  final DateTime date;
  final String mealTime;

  const InputMealScreen({required this.date, required this.mealTime, Key? key})
      : super(key: key);

  @override
  State<InputMealScreen> createState() => _InputMealScreenState();
}

class _InputMealScreenState extends State<InputMealScreen> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  String barcode = 'Unknown';
  SearchResult? searchResult;
  bool searchringBool = false;
  bool searchringBool2 = false;

  // 제품 바코드 검색
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;
    setState(() {
      barcode = barcodeScanRes;
    });

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return MealInformationBarcodeScreen(
            barcode: barcode,
            mealTime: widget.mealTime,
            date: widget.date,
          );
        },
      ),
    );
  }

  // 제품 이름 검색
  void searchProductsByName(String productName) async {
    final ProductSearchQueryConfiguration configuration =
        ProductSearchQueryConfiguration(
      parametersList: [
        SearchTerms(terms: [productName]),
      ],
      language: OpenFoodFactsLanguage.ENGLISH,
    );

    final SearchResult result = await OpenFoodAPIClient.searchProducts(
      User(userId: '', password: ''),
      configuration,
    );

    if (result.products!.isNotEmpty) {
      print('not null');
      setState(() {
        searchResult = result;
      });
    }

    else {
      print('Products found');
      setState(() {
        searchringBool2 = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white, // set background color
        title: Text(
          'Input meal',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left,
              color: Color(0xFF1A5071), size: 40), // set icon color and size
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          height: double.infinity,
          color: Color(0xFFFFFFFF),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _Content(
                      searchringBool: searchringBool,
                      searchringBool2: searchringBool2,
                      searchController: searchController,
                      searchProducts: searchProducts,
                      searchResult: searchResult,
                      mealTime: widget.mealTime,
                      date: widget.date,
                      scanBarcodeNormal: scanBarcodeNormal,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // 외부 데이터베이스로 식단을 저장하고 난 후 내부데이터베이스에 존재하는 식단은 삭제

                              // 외부 데이터베이스 식단 저장 코드 입력
                              final stream = GetIt.I<LocalDatabase>()
                                  .watchProducts(widget.date, widget.mealTime);
                              stream.listen((products) {
                                // handle each event (list of products) that is emitted
                                for (var product in products) {
                                  print(product.id);
                                  print(product);
                                }
                              });

                              // 내부 데이터베이스 식단 모두 삭제
                              GetIt.I<LocalDatabase>().removeAllMeal();
                            },
                            child: Text(
                              'Register',
                              style:
                                  TextStyle(fontSize: 19, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF419D74),
                              disabledBackgroundColor: Color(0xFFBFD4CB),
                              // disabledBackgroundColor: Color(0xFFA5BCC9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void searchProducts() {
    searchProductsByName(searchController.text);
    setState(() {
      searchringBool2 = false;
      searchringBool = true;
      searchResult = null;
    });
  }
}

class _Content extends StatelessWidget {
  final bool searchringBool;
  final bool searchringBool2;
  final TextEditingController searchController;
  final VoidCallback searchProducts;
  final VoidCallback scanBarcodeNormal;
  final DateTime date;
  final String mealTime;
  final SearchResult? searchResult;

  const _Content(
      {required this.searchringBool2,
      required this.searchringBool,
      required this.searchResult,
      required this.searchProducts,
      required this.searchController,
      required this.mealTime,
      required this.date,
      required this.scanBarcodeNormal,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OutlinedButton(
              onPressed: scanBarcodeNormal,
              child: Container(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_scanner,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Start barcode scan',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search product name',
                      ),
                      onSubmitted: (_) => searchProducts(),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: searchProducts,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            searchringBool2
                ? Container(
                    height: 250,
                    child: Center(
                      child: Text('No search results'),
                    ),
                  )
                : searchringBool
                    ? searchResult != null
                        ? Container(
                            height: 250,
                            child: ListView.builder(
                              itemCount: searchResult!.products!.length,
                              itemBuilder: (BuildContext context, int index) {
                                final Product product =
                                    searchResult!.products![index];
                                return ListTile(
                                  title: Text(product.productName ?? ''),
                                  subtitle: Text(product.brands ?? ''),
                                  onTap: () {
                                    double productKcal;
                                    productKcal = product.nutriments
                                            ?.getComputedKJ(
                                                PerSize.oneHundredGrams) ??
                                        0.0;
                                    if (productKcal != null) {
                                      productKcal = productKcal / 4.184;
                                      productKcal =
                                          productKcal.floor().toDouble();
                                    }

                                    print(productKcal);
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return MealInformationNameScreen(
                                            date: date,
                                            mealTime: mealTime,
                                            productBarcode: product.barcode,
                                            productName: product.productName,
                                            productEnergy: productKcal,
                                            productProteins: product?.nutriments
                                                    ?.getValue(
                                                        Nutrient.proteins!,
                                                        PerSize
                                                            .oneHundredGrams!) ??
                                                0,
                                            productFat: product?.nutriments
                                                    ?.getValue(
                                                        Nutrient.fat!,
                                                        PerSize
                                                            .oneHundredGrams!) ??
                                                0,
                                            productCarbo: product?.nutriments
                                                    ?.getValue(
                                                        Nutrient.carbohydrates!,
                                                        PerSize
                                                            .oneHundredGrams!) ??
                                                0,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          )
                        : Container(
                            height: 300,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                    : Container(),
            SizedBox(
              height: 10.0,
            ),
            StreamBuilder<List<MealData>>(
                stream: GetIt.I<LocalDatabase>().watchProducts(date, mealTime),
                builder: (context, snapshot) {
                  // 칼로리 합 계산
                  double productsKcalSum = 0;

                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  for (int i = 0; i < snapshot.data!.length; i++) {
                    productsKcalSum += snapshot.data![i].mealKcal;
                  }

                  return Column(
                    children: [
                      for (int i = 0; i < snapshot.data!.length; i++)
                        Dismissible(
                          key: ObjectKey(snapshot.data![i].id),
                          direction: DismissDirection.endToStart,
                          onDismissed: (DismissDirection direction) {
                            GetIt.I<LocalDatabase>()
                                .removeMeal(snapshot.data![i].id);
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ), //모서리를 둥글게
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 1,
                                  ),
                                  color: Color(0xFFE9E9E9),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18.0, vertical: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 250,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${snapshot.data![i].mealName}(${snapshot.data![i].mealKcal} kcal)'),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.keyboard_backspace,
                                                color: Colors.black,
                                                size: 25.0,
                                              ),
                                              Text('swipe')
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ), //모서리를 둥글게
                          border: Border.all(
                            color: Colors.black12,
                            width: 1,
                          ),
                          color: Color(0xFFE9E9E9),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 26.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total',
                                style: TextStyle(
                                  color: Color(0xFFACACAC),
                                )),
                            Row(
                              children: [
                                Text('${productsKcalSum}   '),
                                Text('Kcal',
                                    style: TextStyle(
                                      color: Color(0xFFACACAC),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
