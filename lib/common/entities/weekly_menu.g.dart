// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_menu.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWeeklyMenuCollection on Isar {
  IsarCollection<WeeklyMenu> get weeklyMenus => this.collection();
}

const WeeklyMenuSchema = CollectionSchema(
  name: r'WeeklyMenu',
  id: -3477233664943529461,
  properties: {
    r'days': PropertySchema(
      id: 0,
      name: r'days',
      type: IsarType.objectList,
      target: r'DailyMenu',
    )
  },
  estimateSize: _weeklyMenuEstimateSize,
  serialize: _weeklyMenuSerialize,
  deserialize: _weeklyMenuDeserialize,
  deserializeProp: _weeklyMenuDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'DailyMenu': DailyMenuSchema},
  getId: _weeklyMenuGetId,
  getLinks: _weeklyMenuGetLinks,
  attach: _weeklyMenuAttach,
  version: '3.1.8',
);

int _weeklyMenuEstimateSize(
  WeeklyMenu object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.days;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[DailyMenu]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              DailyMenuSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _weeklyMenuSerialize(
  WeeklyMenu object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<DailyMenu>(
    offsets[0],
    allOffsets,
    DailyMenuSchema.serialize,
    object.days,
  );
}

WeeklyMenu _weeklyMenuDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeeklyMenu(
    days: reader.readObjectList<DailyMenu>(
      offsets[0],
      DailyMenuSchema.deserialize,
      allOffsets,
      DailyMenu(),
    ),
    id: id,
  );
  return object;
}

P _weeklyMenuDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<DailyMenu>(
        offset,
        DailyMenuSchema.deserialize,
        allOffsets,
        DailyMenu(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _weeklyMenuGetId(WeeklyMenu object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _weeklyMenuGetLinks(WeeklyMenu object) {
  return [];
}

void _weeklyMenuAttach(IsarCollection<dynamic> col, Id id, WeeklyMenu object) {
  object.id = id;
}

extension WeeklyMenuQueryWhereSort
    on QueryBuilder<WeeklyMenu, WeeklyMenu, QWhere> {
  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WeeklyMenuQueryWhere
    on QueryBuilder<WeeklyMenu, WeeklyMenu, QWhereClause> {
  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WeeklyMenuQueryFilter
    on QueryBuilder<WeeklyMenu, WeeklyMenu, QFilterCondition> {
  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> daysIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'days',
      ));
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> daysIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'days',
      ));
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> daysLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'days',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> daysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'days',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> daysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'days',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition>
      daysLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'days',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition>
      daysLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'days',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> daysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'days',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WeeklyMenuQueryObject
    on QueryBuilder<WeeklyMenu, WeeklyMenu, QFilterCondition> {
  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterFilterCondition> daysElement(
      FilterQuery<DailyMenu> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'days');
    });
  }
}

extension WeeklyMenuQueryLinks
    on QueryBuilder<WeeklyMenu, WeeklyMenu, QFilterCondition> {}

extension WeeklyMenuQuerySortBy
    on QueryBuilder<WeeklyMenu, WeeklyMenu, QSortBy> {}

extension WeeklyMenuQuerySortThenBy
    on QueryBuilder<WeeklyMenu, WeeklyMenu, QSortThenBy> {
  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WeeklyMenu, WeeklyMenu, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension WeeklyMenuQueryWhereDistinct
    on QueryBuilder<WeeklyMenu, WeeklyMenu, QDistinct> {}

extension WeeklyMenuQueryProperty
    on QueryBuilder<WeeklyMenu, WeeklyMenu, QQueryProperty> {
  QueryBuilder<WeeklyMenu, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WeeklyMenu, List<DailyMenu>?, QQueryOperations> daysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'days');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DailyMenuSchema = Schema(
  name: r'DailyMenu',
  id: 2696567199558628441,
  properties: {
    r'breakfastRecipeId': PropertySchema(
      id: 0,
      name: r'breakfastRecipeId',
      type: IsarType.long,
    ),
    r'dinnerRecipeId': PropertySchema(
      id: 1,
      name: r'dinnerRecipeId',
      type: IsarType.long,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.long,
    ),
    r'lunchRecipeId': PropertySchema(
      id: 3,
      name: r'lunchRecipeId',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
      enumMap: _DailyMenunameEnumValueMap,
    )
  },
  estimateSize: _dailyMenuEstimateSize,
  serialize: _dailyMenuSerialize,
  deserialize: _dailyMenuDeserialize,
  deserializeProp: _dailyMenuDeserializeProp,
);

int _dailyMenuEstimateSize(
  DailyMenu object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  return bytesCount;
}

void _dailyMenuSerialize(
  DailyMenu object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.breakfastRecipeId);
  writer.writeLong(offsets[1], object.dinnerRecipeId);
  writer.writeLong(offsets[2], object.id);
  writer.writeLong(offsets[3], object.lunchRecipeId);
  writer.writeString(offsets[4], object.name?.name);
}

DailyMenu _dailyMenuDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyMenu(
    breakfastRecipeId: reader.readLongOrNull(offsets[0]),
    dinnerRecipeId: reader.readLongOrNull(offsets[1]),
    id: reader.readLongOrNull(offsets[2]),
    lunchRecipeId: reader.readLongOrNull(offsets[3]),
    name: _DailyMenunameValueEnumMap[reader.readStringOrNull(offsets[4])],
  );
  return object;
}

P _dailyMenuDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (_DailyMenunameValueEnumMap[reader.readStringOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DailyMenunameEnumValueMap = {
  r'monday': r'monday',
  r'tuesday': r'tuesday',
  r'wednesday': r'wednesday',
  r'thursday': r'thursday',
  r'friday': r'friday',
  r'saturday': r'saturday',
  r'sunday': r'sunday',
};
const _DailyMenunameValueEnumMap = {
  r'monday': Day.monday,
  r'tuesday': Day.tuesday,
  r'wednesday': Day.wednesday,
  r'thursday': Day.thursday,
  r'friday': Day.friday,
  r'saturday': Day.saturday,
  r'sunday': Day.sunday,
};

extension DailyMenuQueryFilter
    on QueryBuilder<DailyMenu, DailyMenu, QFilterCondition> {
  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      breakfastRecipeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'breakfastRecipeId',
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      breakfastRecipeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'breakfastRecipeId',
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      breakfastRecipeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'breakfastRecipeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      breakfastRecipeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'breakfastRecipeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      breakfastRecipeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'breakfastRecipeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      breakfastRecipeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'breakfastRecipeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      dinnerRecipeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dinnerRecipeId',
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      dinnerRecipeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dinnerRecipeId',
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      dinnerRecipeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dinnerRecipeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      dinnerRecipeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dinnerRecipeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      dinnerRecipeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dinnerRecipeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      dinnerRecipeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dinnerRecipeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      lunchRecipeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lunchRecipeId',
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      lunchRecipeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lunchRecipeId',
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      lunchRecipeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lunchRecipeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      lunchRecipeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lunchRecipeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      lunchRecipeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lunchRecipeId',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition>
      lunchRecipeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lunchRecipeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> nameEqualTo(
    Day? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> nameGreaterThan(
    Day? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> nameLessThan(
    Day? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> nameBetween(
    Day? lower,
    Day? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyMenu, DailyMenu, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension DailyMenuQueryObject
    on QueryBuilder<DailyMenu, DailyMenu, QFilterCondition> {}
