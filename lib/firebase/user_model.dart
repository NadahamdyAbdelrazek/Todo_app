class UserModel{
  String? id;
  String? email;
  String? phone;
  String? username;
  UserModel({this.id, this.email, this.phone, this.username});
  UserModel.fromJson(Map<String,dynamic> json):this(
    id:json["id"],
    email:json["email"],
    phone:json["phone"],
    username:json["username"],

  );
  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "email":email,
      "phone":phone,
      "username":username,
    };
  }
}