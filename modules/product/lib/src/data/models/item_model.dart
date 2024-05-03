import 'package:core/core.dart';

part 'item_model.g.dart';

@JsonSerializable(createToJson: false)
class ProductItemModel {
  int? id;
  String? name;

  ProductItemModel({this.id, this.name});

  factory ProductItemModel.fromJson(Map<String, dynamic> json) => _$ProductItemModelFromJson(json);
}
