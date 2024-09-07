import 'package:cafetroleum/src/core/core.dart';
import 'package:cafetroleum/src/domain/product/entities/product_entity.dart';

abstract interface class ProductMockDataSource {
  TaskWithFailure<Iterable<ProductEntity>> fetch();
}

@Injectable(as: ProductMockDataSource)
class ProductMockDataSourceImpl implements ProductMockDataSource {
  @override
  TaskWithFailure<Iterable<ProductEntity>> fetch() {
    return TaskEither.right([
      ProductEntity(id: '3', name: 'Potatoes', price: 10),
      ProductEntity(id: '4', name: 'Coffee', price: 2),
      ProductEntity(id: '5', name: 'Bread', price: 3),
      ProductEntity(id: '6', name: 'Milk', price: 10),
      ProductEntity(id: '7', name: 'Cake', price: 25),
      ProductEntity(id: '8', name: 'Pizza', price: 30),
      ProductEntity(id: '9', name: 'Chicken', price: 15),
      ProductEntity(id: '10', name: 'Beer', price: 4),
      ProductEntity(id: '11', name: 'Coke', price: 3),
      ProductEntity(id: '12', name: 'Water', price: 0.5),
      ProductEntity(id: '13', name: 'Soda', price: 4),
    ]);
  }
}
