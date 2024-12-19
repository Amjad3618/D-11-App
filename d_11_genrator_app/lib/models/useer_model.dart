import 'package:get/get.dart';

class UserModel {
  final RxString _name = ''.obs;
  final RxString _email = ''.obs;
  final RxString _userId = ''.obs;

  // Getters
  String get name => _name.value;
  String get email => _email.value;
  String get userId => _userId.value;

  // Setters
  set name(String value) => _name.value = value;
  set email(String value) => _email.value = value;
  set userId(String value) => _userId.value = value;

  UserModel({
    required String name,
    required String email,
    required String userId,
  }) {
    _name.value = name;
    _email.value = email;
    _userId.value = userId;
  }

  // From JSON
  UserModel.fromJson(Map<String, dynamic> json) {
    _name.value = json['name'] ?? '';
    _email.value = json['email'] ?? '';
    _userId.value = json['userId'] ?? '';
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'name': _name.value,
      'email': _email.value,
      'userId': _userId.value,
    };
  }

  // Copy with
  UserModel copyWith({
    String? name,
    String? email,
    String? userId,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      userId: userId ?? this.userId,
    );
  }
}