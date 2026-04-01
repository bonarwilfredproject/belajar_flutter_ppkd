class UserModel {
  int? id;
  String? name;
  String? email;

  UserModel({this.id, this.name, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? json;

    return UserModel(id: data['id'], name: data['name'], email: data['email']);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "email": email};
  }
}
