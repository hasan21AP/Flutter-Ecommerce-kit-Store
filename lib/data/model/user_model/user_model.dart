// ignore_for_file: unnecessary_null_comparison
class UserModel {
  
  String? userId, email, name, pic;

  UserModel({this.userId, this.email, this.name, this.pic});

  UserModel.fromJson(Map<String?, dynamic> map){
    if (map == null){
      return;
    }

    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};

    if (userId != null) data['userId'] = userId;
    if (email != null) data['email'] = email;
    if (name != null) data['name'] = name;
    if (pic != null) data['pic'] = pic;

    return data;
  }

}