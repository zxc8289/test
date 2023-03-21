import 'dart:io';

import 'package:balanstate_test02/model/meal.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Meal,

  ],
)

class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Future<int> createProduct(MealCompanion data) =>
      into(meal).insert(data);

  removeMeal(int id) =>
      (delete(meal)..where((tbl) => tbl.id.equals(id))).go();

  removeAllMeal() =>
      (delete(meal)..where((tbl) => tbl.id.isNotNull())).go();

  Stream<List<MealData>> watchProducts(DateTime date, String mealtime) {
    final query = select(meal);
    query.where((tbl) => tbl.date.equals(date));
    query.where((tbl) => tbl.mealTime.equals(mealtime));
    return query.watch();
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
