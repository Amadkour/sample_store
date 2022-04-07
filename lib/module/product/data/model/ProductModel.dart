
class ProductModel {

  ProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _active = json['active'];
    _stock = json['stock'];
    observedQuantity=1;
    _imageUrl='assets/image.png';

  }
  int? _id;
  String? _imageUrl;
  String? _title;
  int? _price;
  bool? _active;
  int? _stock;
  int? observedQuantity;

  int? get id => _id;
  String? get title => _title;
  int? get price => _price;
  bool? get active => _active;
  int? get stock => _stock;
  String? get  imageUrl => _imageUrl;
}