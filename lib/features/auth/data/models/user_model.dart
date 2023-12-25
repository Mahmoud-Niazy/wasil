class UserModel {
   UserData? user;
   String? token;
   String? status;
   String? stateNum;
   String? message;

  UserModel({
    required this.user,
    required this.message,
    required this.status,
    required this.stateNum,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user: UserData.fromJson(json['user']),
      message: json['message'],
      status: json['status'],
      stateNum: json['stateNum'],
      token: json['token'],
    );
  }
}

class UserData {
   int? id;
   String? name;
   String? email;
   String? mobile;

  UserData({
    required this.email,
    required this.id,
    required this.name,
    required this.mobile,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['email'],
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
    );
  }
}
