import 'package:balanstate_test02/database/drift_database.dart';
import 'package:balanstate_test02/screen/bloodpressure_screen.dart';
import 'package:balanstate_test02/screen/bloodsugar_screen.dart';
import 'package:balanstate_test02/screen/bodycomposition_screen.dart';
import 'package:balanstate_test02/screen/exercise_screen.dart';
import 'package:balanstate_test02/screen/gene_screen.dart';
import 'package:balanstate_test02/screen/login_screen.dart';
import 'package:balanstate_test02/screen/meal_screen.dart';
import 'package:balanstate_test02/screen/sleep_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

const Meal_Route = '/Meal';
const Exercise_Route = '/Exercise';
const Sleep_Route = '/Sleep';

const BodyComposition_Route = '/Body Composition';
const BloodSugar_Route = '/Blood Sugar';
const BloodPressure_Route = '/Blood Pressure';

const Gene_Route = '/Gene';
const MedicalCheckup_Route = '/Medical Checkup';
const PersonalCare_Route = '/Personal Care';

void main() {
  final database = LocalDatabase();

  GetIt.I.registerSingleton<LocalDatabase>(database);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        Meal_Route: (context) => MealScreen(),
        Exercise_Route: (context) => ExerciseScreen(),
        Sleep_Route: (context) => SleepScreen(),

        BodyComposition_Route: (context) => BodyCompositionScreen(),
        BloodSugar_Route: (context) => BloodSugarScreen(),
        BloodPressure_Route: (context) => BloodPressureScreen(),

        Gene_Route: (context) => GeneScreen(),
        MedicalCheckup_Route: (context) => ExerciseScreen(),
        PersonalCare_Route: (context) => SleepScreen(),
      },
    ),
  );
}
