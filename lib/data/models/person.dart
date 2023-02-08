class Person {
  final String title;
  final String firstname;
  final String lastname;

  Person(this.title, this.firstname, this.lastname);

  String get fullName {
    return '$title $firstname $lastname';
  }
}
