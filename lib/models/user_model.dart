class UserModel {
  late String uid;
  late String name;
  late String email;
  late String? profileImage;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.profileImage,
  });

  static Map<String, dynamic> toMap(UserModel userModel) {
    var data = <String, dynamic>{};
    data['uid'] = userModel.uid;
    data['name'] = userModel.name;
    data['email'] = userModel.email;
    data['profileImage'] = userModel.profileImage;
    return data;
  }

  UserModel.fromMap(Map<String, dynamic> mapData) {
    uid = mapData['uid'];
    name = mapData['name'];
    email = mapData['email'];
    profileImage = mapData['profileImage'];
  }
}
