import 'package:flutter_test/flutter_test.dart';
import 'package:oddshub/registration/model.dart';

void main() {
  group('Registration model', () {
    test('Invalid data for registration', () {
      final registration = Registration(
        email: '',
        firstName: '',
        lastName: '',
        phoneNumber: '',
        title: '',
      );
      final isValid = registration.validate();
      expect(isValid, false);
    });

    test('Valid data for registration', () {
      final registration = Registration(
        title: 'Mr',
        firstName: 'Test',
        lastName: 'Model',
        email: 'test@odds.team',
        phoneNumber: '0876543210',
      );
      final isValid = registration.validate();
      expect(isValid, true);
    });

    test('Map data for request register', () {
      final registration = Registration(
        title: 'Mr',
        firstName: 'Test',
        lastName: 'Model',
        email: 'test@odds.team',
        phoneNumber: '0876543210',
      );
      final requestData = registration.toRequestRegistration(1);
      expect(requestData, <String, dynamic>{
        'title': 'Mr',
        'firstName': 'Test',
        'lastName': 'Model',
        'email': 'test@odds.team',
        'phone': '0876543210',
        'classId': 1
      });
    });
  });
}
