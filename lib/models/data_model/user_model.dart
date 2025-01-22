class UserModel {
  int? id;
  String? fullName;
  String? email;
  int? gender;
  DateTime? dateOfBirth;

  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.gender,
    this.dateOfBirth,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'] != null
        ? DateTime.parse(json['dateOfBirth'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['email'] = email;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;

    return data;
  }

  @override
  String toString() {
    return 'UserModel{id: $id, fullName: $fullName, email: $email, gender: $gender, dateOfBirth: $dateOfBirth}';
  }
}
