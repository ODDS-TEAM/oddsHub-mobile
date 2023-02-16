class Registration {
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  Registration({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  @override
  String toString() {
    return '$title, $firstName, $lastName, $email, $phoneNumber';
  }

  bool validate() {
    return title.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isNotEmpty &&
        phoneNumber.isNotEmpty;
  }
}
