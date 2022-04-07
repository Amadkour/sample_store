/// id : 1
/// title : "ut cum est"
/// price : 218
/// active : true
/// stock : 484
/// categories : [{"id":2,"title":"praesentium necessitatibus sint"}]

class ProductModel {

  ProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _price = json['price'];
    _active = json['active'];
    _stock = json['stock'];
    observedQuantity=1;
  }
  int? _id;
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['price'] = _price;
    map['active'] = _active;
    map['stock'] = _stock;
    return map;
  }

}