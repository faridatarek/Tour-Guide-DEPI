import 'package:hive/hive.dart';

part 'visit_model.g.dart';

@HiveType(typeId: 0)
class VisitModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String image;

  @HiveField(2)
  final DateTime visitDate;

  @HiveField(3)
  final String governorate;

  @HiveField(4)
  final String area;

  @HiveField(5)
  final String address;

  @HiveField(6)
  final String visitingHours;

  @HiveField(7)
  final String ticketPrice;

  @HiveField(8)
  final String description;

  VisitModel({
    required this.name,
    required this.image,
    required this.visitDate,
    required this.governorate,
    required this.area,
    required this.address,
    required this.visitingHours,
    required this.ticketPrice,
    required this.description,
  });
}
