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

class MealInformationNameScreen extends StatefulWidget {
  final DateTime date;
  final String mealTime;
  final String? productBarcode;
  final String? productName;
  final double? productEnergy;
  final double? productCarbo;
  final double? productProteins;
  final double? productFat;

  const MealInformationNameScreen(
      {required this.date,
      required this.mealTime,
      required this.productBarcode,
        required this.productName,
        required this.productProteins,
        required this.productFat,
        required this.productEnergy,
        required this.productCarbo,
      Key? key})
      : super(key: key);

  @override
  State<MealInformationNameScreen> createState() =>
      _MealInformationNameScreenState();
}

class _MealInformationNameScreenState extends State<MealInformationNameScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();


  // 제품 정보 저장
  int? productBarcode;
  String? productName;
  int? productGramNumber;
  double? productEnergy;
  double? productCarbo;
  double? productProteins;
  double? productFat;

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
                child: Column(
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
                                    productIngredients: widget.productBarcode,
                                    onSaved: (String? val) {
                                      productBarcode = int.parse(val!);
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('Product name'),
                                  MealCustomTextField(
                                    productIngredients: widget.productName,
                                    onSaved: (String? val) {
                                      productName = val;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('Energy'),
                                  MealCustomTextField(
                                    productIngredients: '${widget.productEnergy}',
                                    onSaved: (String? val) {
                                      productEnergy = double.parse(val!);
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text('Carbohydrates'),
                                  MealCustomTextField(
                                    productIngredients:
                                        '${widget.productCarbo}',
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
                                        '${widget.productProteins}',
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
                                        '${widget.productFat}',
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
      // print(productBarcode);
      // print(productName);
      // print(productEnergy);
      // print(productCarbo);
      // print(productProteins);
      // print(productFat);
      // print(widget.mealTime);
      // print(widget.date);

      final key = await GetIt.I<LocalDatabase>().createProduct(
        MealCompanion(
          date: Value(widget.date),
          mealTime: Value(widget.mealTime),
          mealName: Value(productName!),
          mealKcal: Value(productEnergy!),
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
