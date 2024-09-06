import 'package:freezed/freezed.dart';

@Freezed()
class ProductEntity {
  const ProductEntity({
    required String id,
    required String name,
    required double price,
  });
}
