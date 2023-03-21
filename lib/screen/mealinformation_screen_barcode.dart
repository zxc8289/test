import 'package:balanstate_test02/componnent/meal_custom_text_field.dart';
import 'package:balanstate_test02/database/drift_database.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:openfoodfacts/model/Nutrient.dart';
import 'package:openfoodfacts/model/PerSize.dart';
import 'package:openfoodfacts/model/Product.dart';
import 'package:openfoodfacts/model/ProductResultV3.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class MealInformationBarcodeScreen extends StatefulWidget {
  final String barcode;
  final DateTime date;
  final String mealTime;

  const MealInformationBarcodeScreen(
      {required this.date,
      required this.mealTime,
      required this.barcode,
      Key? key})
      : super(key: key);

  @override
  State<MealInformationBarcodeScreen> createState() =>
      _MealInformationBarcodeScreenState();
}

class _MealInformationBarcodeScreenState extends State<MealInformationBarcodeScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  late Product product = Product();
  var productKcal;
  bool noSearch = false;

  // 제품 정보 저장
  int? productBarcode;
  String? productName;
  int? productGramNumber;
  double? productEnergy;
  double? productCarbo;
  double? productProteins;
  double? productFat;

  void initState() {
    fetchProduct(widget.barcode);
    super.initState();
  }

  Future<void> fetchProduct(String barcode) async {
    final ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcode,
      language: OpenFoodFactsLanguage.ENGLISH,
      fields: [ProductField.ALL],
      version: ProductQueryVersion.v3,
    );

    final ProductResultV3 result =
        await OpenFoodAPIClient.getProductV3(configuration);
    if (result.status == ProductResultV3.statusSuccess) {
      setState(() {
        if (product != null) {
          product = result.product!;
          productKcal =
              product.nutriments?.getComputedKJ(PerSize.oneHundredGrams);
          if (productKcal != null) {
            productKcal = productKcal / 4.184;
            productKcal = productKcal.floor();
          }
        }
      });
    }

    if (result.status != ProductResultV3.statusSuccess) {
      setState(() {
        noSearch = true;
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
          'product information',
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
                child: noSearch
                    ? Center(
                        child: Text(
                          'No product information found for barcode ${widget.barcode}.',
                          style: TextStyle(fontSize: 20.0),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('Barcode'),
                                  MealCustomTextField(
                                    productIngredients: product.barcode,
                                    onSaved: (String? val) {
                                      productBarcode = int.parse(val!);
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('Product name'),
                                  MealCustomTextField(
                                    productIngredients: product.productName,
                                    onSaved: (String? val) {
                                      productName = val;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('Energy'),
                                  MealCustomTextField(
                                    productIngredients: '${productKcal}',
                                    onSaved: (String? val) {
                                      productKcal = double.parse(val!);
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('Carbohydrates'),
                                  MealCustomTextField(
                                    productIngredients:
                                        '${product?.nutriments?.getValue(Nutrient.carbohydrates!, PerSize.oneHundredGrams!) ?? noSearch}',
                                    onSaved: (String? val) {
                                      productCarbo = double.parse(val!);
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('Proteins'),
                                  MealCustomTextField(
                                    productIngredients:
                                        '${product?.nutriments?.getValue(Nutrient.proteins!, PerSize.oneHundredGrams!) ?? noSearch}',
                                    onSaved: (String? val) {
                                      productProteins = double.parse(val!);
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('Fat'),
                                  MealCustomTextField(
                                    productIngredients:
                                        '${product?.nutriments?.getValue(Nutrient.fat!, PerSize.oneHundredGrams!) ?? noSearch}',
                                    onSaved: (String? val) {
                                      productFat = double.parse(val!);
                                    },
                                  ),
                                ],
                              ),
                            ),
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
                                  onPressed: onSavePressed,
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                        fontSize: 19, color: Colors.white),
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

  void onSavePressed() async {
    if (formKey.currentState == null) {
      print('에러');
      return;
    }

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      print(productBarcode);
      print(productName);
      print(productKcal);
      print(productCarbo);
      print(productProteins);
      print(productFat);
      print(widget.mealTime);
      print(widget.date);

      final key = await GetIt.I<LocalDatabase>().createProduct(
        MealCompanion(
          date: Value(widget.date),
          mealTime: Value(widget.mealTime),
          mealName: Value(productName!),
          mealKcal: Value(productKcal!),
          mealCarbs: Value(productCarbo!),
          mealProteins: Value(productProteins!),
          mealFat: Value(productFat!),
        ),
      );

      print('Save $key');

      Navigator.of(context).pop();
    }
  }
}
