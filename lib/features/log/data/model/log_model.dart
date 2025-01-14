// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
part 'log_model.freezed.dart';
part 'log_model.g.dart';

@Freezed()
class MyLogModel with _$MyLogModel {
  const factory MyLogModel(
      {String? id,
      String? productId,
      String? description,
      String? name,
      String? date,
      String? game,
      String? image,
      String? url}) = _MyLogModel;

  factory MyLogModel.fromJson(Map<String, dynamic> json) =>
      _$MyLogModelFromJson(json);
}
