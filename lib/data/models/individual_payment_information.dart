import 'package:oddshub/data/models/course.dart';
import 'package:oddshub/data/models/person.dart';

class IndividualPaymentInformation {
  final Course course;
  final Person customer;

  IndividualPaymentInformation(this.course, this.customer);
}
