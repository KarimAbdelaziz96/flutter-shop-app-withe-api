// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class HomeModel {
  bool? status;
  late HomDataModel data;

  HomeModel.fromJson(Map<String, dynamic> Json) {
    status = Json['status'];
    data = HomDataModel.fromJson(Json['data']);
  }
}

class HomDataModel {
  final List<BannersModel> banners = [];
  final List<ProuductsModel> products = [];
  HomDataModel.fromJson(Map<String, dynamic> Json) {
    Json['banners'].forEach((element) {
      banners.add(BannersModel.fromJson(element));
    });

    Json['products'].forEach((element) {
      products.add(ProuductsModel.fromJson  (element));
    });
  }
}

class BannersModel {
  late int id;
  late String image;
  BannersModel.fromJson(Map<String, dynamic> Json) {
    
    id = Json['id'];
    image = Json['image'];
  }
}

class ProuductsModel {
  late int id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String image="";
  String? name;
  bool? infavorites;
  bool? incart;

  ProuductsModel.fromJson(Map<String, dynamic> JSon) {
    id = JSon['id'];
    price = JSon['price'];
    old_price = JSon['old_price'];
    discount = JSon['discount'];
    image = JSon['image'];
    name = JSon['name'];
    infavorites = JSon['in_favorites'];
    incart = JSon['in_cart'];
  }
}
