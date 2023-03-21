import 'package:drift/drift.dart';

class Meal extends Table{
  // id 값
  IntColumn get id => integer().autoIncrement()();

  // 일정 날짜
  DateTimeColumn get date => dateTime()();

  // 아침, 점심, 저녁
  TextColumn get mealTime => text()();

  // 제품 이름
  TextColumn get mealName => text()();

  // 제품 칼로리
  RealColumn get mealKcal => real()();

  // 제품 탄수화물
  RealColumn get mealCarbs => real()();

  // 제품 단백질
  RealColumn get mealProteins => real()();

  // 제품 지방
  RealColumn get mealFat => real()();

  // 데이터 생성 날짜
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now(), )();
}