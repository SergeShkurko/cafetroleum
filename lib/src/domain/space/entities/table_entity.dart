import 'package:freezed/freezed.dart';

@Freezed()
class TableEntity {
  final String id;
  final String roomId;
  final int seats;
}
