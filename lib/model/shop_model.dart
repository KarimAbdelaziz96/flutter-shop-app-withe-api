class ShopAppModel {
  late bool status;
  late String message;
  late UserData data;

    ShopAppModel.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
     if (json['data'] != null) {
  data = UserData.fromjson(json['data']);
} else {
  UserData;
}
   
  }
 

}

class UserData {
  late int? id;
  late String? name;
  late String?email;
  late String? phone;
  late String? image;
  late int? points;
  late int? creadit;
  late String? token;

  UserData.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    creadit = json['creadit'];
    token = json['token'];
  }
}




