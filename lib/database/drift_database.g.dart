// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MealData extends DataClass implements Insertable<MealData> {
  final int id;
  final DateTime date;
  final String mealTime;
  final String mealName;
  final double mealKcal;
  final double mealCarbs;
  final double mealProteins;
  final double mealFat;
  final DateTime createdAt;
  MealData(
      {required this.id,
      required this.date,
      required this.mealTime,
      required this.mealName,
      required this.mealKcal,
      required this.mealCarbs,
      required this.mealProteins,
      required this.mealFat,
      required this.createdAt});
  factory MealData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MealData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      mealTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_time'])!,
      mealName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_name'])!,
      mealKcal: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_kcal'])!,
      mealCarbs: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_carbs'])!,
      mealProteins: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_proteins'])!,
      mealFat: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meal_fat'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['meal_time'] = Variable<String>(mealTime);
    map['meal_name'] = Variable<String>(mealName);
    map['meal_kcal'] = Variable<double>(mealKcal);
    map['meal_carbs'] = Variable<double>(mealCarbs);
    map['meal_proteins'] = Variable<double>(mealProteins);
    map['meal_fat'] = Variable<double>(mealFat);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MealCompanion toCompanion(bool nullToAbsent) {
    return MealCompanion(
      id: Value(id),
      date: Value(date),
      mealTime: Value(mealTime),
      mealName: Value(mealName),
      mealKcal: Value(mealKcal),
      mealCarbs: Value(mealCarbs),
      mealProteins: Value(mealProteins),
      mealFat: Value(mealFat),
      createdAt: Value(createdAt),
    );
  }

  factory MealData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      mealTime: serializer.fromJson<String>(json['mealTime']),
      mealName: serializer.fromJson<String>(json['mealName']),
      mealKcal: serializer.fromJson<double>(json['mealKcal']),
      mealCarbs: serializer.fromJson<double>(json['mealCarbs']),
      mealProteins: serializer.fromJson<double>(json['mealProteins']),
      mealFat: serializer.fromJson<double>(json['mealFat']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'mealTime': serializer.toJson<String>(mealTime),
      'mealName': serializer.toJson<String>(mealName),
      'mealKcal': serializer.toJson<double>(mealKcal),
      'mealCarbs': serializer.toJson<double>(mealCarbs),
      'mealProteins': serializer.toJson<double>(mealProteins),
      'mealFat': serializer.toJson<double>(mealFat),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MealData copyWith(
          {int? id,
          DateTime? date,
          String? mealTime,
          String? mealName,
          double? mealKcal,
          double? mealCarbs,
          double? mealProteins,
          double? mealFat,
          DateTime? createdAt}) =>
      MealData(
        id: id ?? this.id,
        date: date ?? this.date,
        mealTime: mealTime ?? this.mealTime,
        mealName: mealName ?? this.mealName,
        mealKcal: mealKcal ?? this.mealKcal,
        mealCarbs: mealCarbs ?? this.mealCarbs,
        mealProteins: mealProteins ?? this.mealProteins,
        mealFat: mealFat ?? this.mealFat,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('MealData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('mealTime: $mealTime, ')
          ..write('mealName: $mealName, ')
          ..write('mealKcal: $mealKcal, ')
          ..write('mealCarbs: $mealCarbs, ')
          ..write('mealProteins: $mealProteins, ')
          ..write('mealFat: $mealFat, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, mealTime, mealName, mealKcal,
      mealCarbs, mealProteins, mealFat, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealData &&
          other.id == this.id &&
          other.date == this.date &&
          other.mealTime == this.mealTime &&
          other.mealName == this.mealName &&
          other.mealKcal == this.mealKcal &&
          other.mealCarbs == this.mealCarbs &&
          other.mealProteins == this.mealProteins &&
          other.mealFat == this.mealFat &&
          other.createdAt == this.createdAt);
}

class MealCompanion extends UpdateCompanion<MealData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> mealTime;
  final Value<String> mealName;
  final Value<double> mealKcal;
  final Value<double> mealCarbs;
  final Value<double> mealProteins;
  final Value<double> mealFat;
  final Value<DateTime> createdAt;
  const MealCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.mealTime = const Value.absent(),
    this.mealName = const Value.absent(),
    this.mealKcal = const Value.absent(),
    this.mealCarbs = const Value.absent(),
    this.mealProteins = const Value.absent(),
    this.mealFat = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  MealCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    required String mealTime,
    required String mealName,
    required double mealKcal,
    required double mealCarbs,
    required double mealProteins,
    required double mealFat,
    this.createdAt = const Value.absent(),
  })  : date = Value(date),
        mealTime = Value(mealTime),
        mealName = Value(mealName),
        mealKcal = Value(mealKcal),
        mealCarbs = Value(mealCarbs),
        mealProteins = Value(mealProteins),
        mealFat = Value(mealFat);
  static Insertable<MealData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<String>? mealTime,
    Expression<String>? mealName,
    Expression<double>? mealKcal,
    Expression<double>? mealCarbs,
    Expression<double>? mealProteins,
    Expression<double>? mealFat,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (mealTime != null) 'meal_time': mealTime,
      if (mealName != null) 'meal_name': mealName,
      if (mealKcal != null) 'meal_kcal': mealKcal,
      if (mealCarbs != null) 'meal_carbs': mealCarbs,
      if (mealProteins != null) 'meal_proteins': mealProteins,
      if (mealFat != null) 'meal_fat': mealFat,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  MealCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<String>? mealTime,
      Value<String>? mealName,
      Value<double>? mealKcal,
      Value<double>? mealCarbs,
      Value<double>? mealProteins,
      Value<double>? mealFat,
      Value<DateTime>? createdAt}) {
    return MealCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      mealTime: mealTime ?? this.mealTime,
      mealName: mealName ?? this.mealName,
      mealKcal: mealKcal ?? this.mealKcal,
      mealCarbs: mealCarbs ?? this.mealCarbs,
      mealProteins: mealProteins ?? this.mealProteins,
      mealFat: mealFat ?? this.mealFat,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (mealTime.present) {
      map['meal_time'] = Variable<String>(mealTime.value);
    }
    if (mealName.present) {
      map['meal_name'] = Variable<String>(mealName.value);
    }
    if (mealKcal.present) {
      map['meal_kcal'] = Variable<double>(mealKcal.value);
    }
    if (mealCarbs.present) {
      map['meal_carbs'] = Variable<double>(mealCarbs.value);
    }
    if (mealProteins.present) {
      map['meal_proteins'] = Variable<double>(mealProteins.value);
    }
    if (mealFat.present) {
      map['meal_fat'] = Variable<double>(mealFat.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('mealTime: $mealTime, ')
          ..write('mealName: $mealName, ')
          ..write('mealKcal: $mealKcal, ')
          ..write('mealCarbs: $mealCarbs, ')
          ..write('mealProteins: $mealProteins, ')
          ..write('mealFat: $mealFat, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MealTable extends Meal with TableInfo<$MealTable, MealData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _mealTimeMeta = const VerificationMeta('mealTime');
  @override
  late final GeneratedColumn<String?> mealTime = GeneratedColumn<String?>(
      'meal_time', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _mealNameMeta = const VerificationMeta('mealName');
  @override
  late final GeneratedColumn<String?> mealName = GeneratedColumn<String?>(
      'meal_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _mealKcalMeta = const VerificationMeta('mealKcal');
  @override
  late final GeneratedColumn<double?> mealKcal = GeneratedColumn<double?>(
      'meal_kcal', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _mealCarbsMeta = const VerificationMeta('mealCarbs');
  @override
  late final GeneratedColumn<double?> mealCarbs = GeneratedColumn<double?>(
      'meal_carbs', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _mealProteinsMeta =
      const VerificationMeta('mealProteins');
  @override
  late final GeneratedColumn<double?> mealProteins = GeneratedColumn<double?>(
      'meal_proteins', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _mealFatMeta = const VerificationMeta('mealFat');
  @override
  late final GeneratedColumn<double?> mealFat = GeneratedColumn<double?>(
      'meal_fat', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        mealTime,
        mealName,
        mealKcal,
        mealCarbs,
        mealProteins,
        mealFat,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? 'meal';
  @override
  String get actualTableName => 'meal';
  @override
  VerificationContext validateIntegrity(Insertable<MealData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('meal_time')) {
      context.handle(_mealTimeMeta,
          mealTime.isAcceptableOrUnknown(data['meal_time']!, _mealTimeMeta));
    } else if (isInserting) {
      context.missing(_mealTimeMeta);
    }
    if (data.containsKey('meal_name')) {
      context.handle(_mealNameMeta,
          mealName.isAcceptableOrUnknown(data['meal_name']!, _mealNameMeta));
    } else if (isInserting) {
      context.missing(_mealNameMeta);
    }
    if (data.containsKey('meal_kcal')) {
      context.handle(_mealKcalMeta,
          mealKcal.isAcceptableOrUnknown(data['meal_kcal']!, _mealKcalMeta));
    } else if (isInserting) {
      context.missing(_mealKcalMeta);
    }
    if (data.containsKey('meal_carbs')) {
      context.handle(_mealCarbsMeta,
          mealCarbs.isAcceptableOrUnknown(data['meal_carbs']!, _mealCarbsMeta));
    } else if (isInserting) {
      context.missing(_mealCarbsMeta);
    }
    if (data.containsKey('meal_proteins')) {
      context.handle(
          _mealProteinsMeta,
          mealProteins.isAcceptableOrUnknown(
              data['meal_proteins']!, _mealProteinsMeta));
    } else if (isInserting) {
      context.missing(_mealProteinsMeta);
    }
    if (data.containsKey('meal_fat')) {
      context.handle(_mealFatMeta,
          mealFat.isAcceptableOrUnknown(data['meal_fat']!, _mealFatMeta));
    } else if (isInserting) {
      context.missing(_mealFatMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MealData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MealTable createAlias(String alias) {
    return $MealTable(attachedDatabase, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MealTable meal = $MealTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [meal];
}
