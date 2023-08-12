import 'dart:io';

class Dogs {
  Dogs({
    required this.date,
    required this.img,
    required this.gender,
    required this.size,
    required this.action,
  });

  final DateTime date;
  final File? img;
  final String gender;
  final String size;
  final String action;
}
