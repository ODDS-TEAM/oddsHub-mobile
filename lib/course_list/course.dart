import 'package:intl/intl.dart';

class Course {
  final int id;
  final int classId;
  final String name;
  final String image;
  final String description;
  final String instructor;
  final double price;
  final DateTime startDate;

  Course(
    this.id,
    this.classId,
    this.name,
    this.image,
    this.description,
    this.instructor,
    this.price,
    this.startDate,
  );

  Course.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        classId = json['classId'],
        name = json['name'],
        image = json['image'],
        description = json['description'],
        instructor = json['instructor'],
        price = double.tryParse(json['price'].toString()) ?? 0,
        startDate = DateTime.parse(json['startDate'].toString());

  String get formattedDate {
    return DateFormat.yMMMMd('en_US').format(startDate);
  }

  String get formattedPrice {
    return NumberFormat.currency(locale: 'th_TH', symbol: '฿').format(price);
  }
}
