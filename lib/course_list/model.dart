import 'package:intl/intl.dart';

class Course {
  final int id;
  final int classId;
  final String name;
  final String image;
  final String description;
  final String _instructor;
  final double _price;
  final DateTime startDate;
  final ClassPeople _people;

  Course(
    this.id,
    this.classId,
    this.name,
    this.image,
    this.description,
    this._instructor,
    this._price,
    this.startDate,
    this._people,
  );

  Course.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        classId = json['classId'],
        name = json['name'],
        image = json['image'],
        description = json['description'],
        _instructor = json['instructor'],
        _people = ClassPeople(20, 30),
        // _people = ClassPeople.fromJson(json['people']),
        _price = double.tryParse(json['price'].toString()) ?? 0,
        startDate = DateTime.parse(json['startDate'].toString());

  String get formattedDate {
    return DateFormat('dd MMM yyyy', 'en_US').format(startDate);
  }

  String get price {
    return '${NumberFormat.currency(
      locale: 'th_TH',
      symbol: '',
      decimalDigits: 0,
    ).format(_price)} Baht';
  }

  String get instructor {
    return 'by $_instructor';
  }

  String get remainderPeople {
    return _people.remainder;
  }
}

class ClassPeople {
  final int joined;
  final int max;

  ClassPeople(this.joined, this.max);

  ClassPeople.fromJson(Map<String, dynamic> json)
      : joined = json['joined'],
        max = json['max'];

  String get remainder {
    return '$joined / $max people';
  }
}
