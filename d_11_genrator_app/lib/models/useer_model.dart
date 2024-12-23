// user_model.dart
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class UserModel {
  final RxString _name = ''.obs;
  final RxString _email = ''.obs;
  final RxString _userId = ''.obs;
  final RxString _profileImageUrl = ''.obs;

  // Getters
  String get name => _name.value;
  String get email => _email.value;
  String get userId => _userId.value;
  String? get profileImageUrl => _profileImageUrl.value;

  // Setters
  set name(String value) => _name.value = value;
  set email(String value) => _email.value = value;
  set userId(String value) => _userId.value = value;
  set profileImageUrl(String? value) => _profileImageUrl.value = value ?? '';

  UserModel({
    required String name,
    required String email,
    required String userId,
    String? profileImageUrl,
  }) {
    _name.value = name;
    _email.value = email;
    _userId.value = userId;
    _profileImageUrl.value = profileImageUrl ?? '';
  }

  // From JSON
  UserModel.fromJson(Map<String, dynamic> json) {
    _name.value = json['name'] ?? '';
    _email.value = json['email'] ?? '';
    _userId.value = json['userId'] ?? '';
    _profileImageUrl.value = json['profileImageUrl'] ?? '';
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'name': _name.value,
      'email': _email.value,
      'userId': _userId.value,
      'profileImageUrl': _profileImageUrl.value,
    };
  }
}
