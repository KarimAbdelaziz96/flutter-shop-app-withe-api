// ignore_for_file: non_constant_identifier_names

class CategoriesModel {
  late bool status;
  String? message;
  late CategoriesDataModel data;

    CategoriesModel({required this.status, this.message, required this.data});


  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
        message = json['message'];

    data = CategoriesDataModel.fromJson(json['data']);
  }
 
}

class CategoriesDataModel {
  late int? currentpage;
  late List<DataModel> data = [];

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    currentpage = json['current_page'];
    json['data'].forEach((Element) {
      data.add(DataModel.fromJson(Element));
    });
  }
}

class DataModel {
  late int? id;
  late String? name;
  late String? image;
  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
