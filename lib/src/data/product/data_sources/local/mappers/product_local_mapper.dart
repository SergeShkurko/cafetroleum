import 'package:cafetroleum/src/core/database/database.dart';
import 'package:cafetroleum/src/domain/product/entities/product_entity.dart';

class ProductLocalMapper {
  static ProductEntity toEntity(ProductLocalModel m) =>
      ProductEntity(id: m.id, name: m.name, price: m.price);

  static ProductsCompanion toInsertCompanion(ProductEntity e) =>
      ProductsCompanion.insert(id: e.id, name: e.name, price: e.price);
}
