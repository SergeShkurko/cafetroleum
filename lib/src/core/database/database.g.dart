// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProductLocalModelTable extends ProductLocalModel
    with TableInfo<$ProductLocalModelTable, ProductLocalModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductLocalModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<ProductLocalModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductLocalModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductLocalModel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $ProductLocalModelTable createAlias(String alias) {
    return $ProductLocalModelTable(attachedDatabase, alias);
  }
}

class ProductLocalModel extends DataClass
    implements Insertable<ProductLocalModel> {
  final String id;
  final String name;
  final double price;
  const ProductLocalModel(
      {required this.id, required this.name, required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    return map;
  }

  ProductLocalModelCompanion toCompanion(bool nullToAbsent) {
    return ProductLocalModelCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
    );
  }

  factory ProductLocalModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductLocalModel(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
    };
  }

  ProductLocalModel copyWith({String? id, String? name, double? price}) =>
      ProductLocalModel(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
      );
  ProductLocalModel copyWithCompanion(ProductLocalModelCompanion data) {
    return ProductLocalModel(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductLocalModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductLocalModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price);
}

class ProductLocalModelCompanion extends UpdateCompanion<ProductLocalModel> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> price;
  final Value<int> rowid;
  const ProductLocalModelCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductLocalModelCompanion.insert({
    required String id,
    required String name,
    required double price,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        price = Value(price);
  static Insertable<ProductLocalModel> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? price,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductLocalModelCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<double>? price,
      Value<int>? rowid}) {
    return ProductLocalModelCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductLocalModelCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductLocalModelTable productLocalModel =
      $ProductLocalModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productLocalModel];
}

typedef $$ProductLocalModelTableCreateCompanionBuilder
    = ProductLocalModelCompanion Function({
  required String id,
  required String name,
  required double price,
  Value<int> rowid,
});
typedef $$ProductLocalModelTableUpdateCompanionBuilder
    = ProductLocalModelCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<double> price,
  Value<int> rowid,
});

class $$ProductLocalModelTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProductLocalModelTable> {
  $$ProductLocalModelTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ProductLocalModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProductLocalModelTable> {
  $$ProductLocalModelTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ProductLocalModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductLocalModelTable,
    ProductLocalModel,
    $$ProductLocalModelTableFilterComposer,
    $$ProductLocalModelTableOrderingComposer,
    $$ProductLocalModelTableCreateCompanionBuilder,
    $$ProductLocalModelTableUpdateCompanionBuilder,
    (
      ProductLocalModel,
      BaseReferences<_$AppDatabase, $ProductLocalModelTable, ProductLocalModel>
    ),
    ProductLocalModel,
    PrefetchHooks Function()> {
  $$ProductLocalModelTableTableManager(
      _$AppDatabase db, $ProductLocalModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProductLocalModelTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$ProductLocalModelTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductLocalModelCompanion(
            id: id,
            name: name,
            price: price,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required double price,
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductLocalModelCompanion.insert(
            id: id,
            name: name,
            price: price,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductLocalModelTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductLocalModelTable,
    ProductLocalModel,
    $$ProductLocalModelTableFilterComposer,
    $$ProductLocalModelTableOrderingComposer,
    $$ProductLocalModelTableCreateCompanionBuilder,
    $$ProductLocalModelTableUpdateCompanionBuilder,
    (
      ProductLocalModel,
      BaseReferences<_$AppDatabase, $ProductLocalModelTable, ProductLocalModel>
    ),
    ProductLocalModel,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductLocalModelTableTableManager get productLocalModel =>
      $$ProductLocalModelTableTableManager(_db, _db.productLocalModel);
}
