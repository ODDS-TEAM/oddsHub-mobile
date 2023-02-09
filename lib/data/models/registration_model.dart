import 'dart:ffi';

class RegistrationModel {
  final Long? id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;

  const RegistrationModel({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    try {
      return RegistrationModel(
        id: json['id'],
        title: json['title'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
      );
    } catch (exception) {
      throw Exception('Something went wrong!!');
    }
  }
}
