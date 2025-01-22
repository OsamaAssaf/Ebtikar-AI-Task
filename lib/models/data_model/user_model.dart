class UserModel {
  int? id;
  String? fullName;
  String? email;
  DateTime? dateOfBirth;

  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.dateOfBirth,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'] != null ? DateTime.parse(json['dateOfBirth']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['email'] = email;
    data['dateOfBirth'] = dateOfBirth;

    return data;
  }
}
