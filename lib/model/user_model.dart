import 'dart:convert';

class UserModel {
  Data data;
  String message;

  UserModel({
    required this.data,
    required this.message,
  });

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
  };


  @override
  String toString() {
    return 'UserModel{data: $data, message: $message}';
  }
}

class Data {
  User user;
  String accessToken;
  String tokenType;

  Data({
    required this.user,
    required this.accessToken,
    required this.tokenType,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    accessToken: json["access_token"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "access_token": accessToken,
    "token_type": tokenType,
  };


  @override
  String toString() {
    return 'Data{user: $user, accessToken: $accessToken, tokenType: $tokenType}';
  }
}

class User {
  String name;
  String email;
  String fcmToken;

  User({
    required this.name,
    required this.email,
    required this.fcmToken,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    fcmToken: json["fcm_token"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "fcm_token": fcmToken,
  };

  @override
  String toString() {
    return 'User{name: $name, email: $email, fcmToken: $fcmToken}';
  }
}
