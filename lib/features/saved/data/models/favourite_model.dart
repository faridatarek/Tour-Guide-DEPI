import 'package:hive/hive.dart';

part 'favourite_model.g.dart';

@HiveType(typeId: 1)
class FavouriteModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String image;

  @HiveField(2)
  final String governorate;

  @HiveField(3)
  final String area;

  @HiveField(4)
  final String address;

  @HiveField(5)
  final String visitingHours;

  @HiveField(6)
  final String ticketPrice;

  @HiveField(7)
  final String description;

  FavouriteModel({
    required this.name,
    required this.image,
    required this.governorate,
    required this.area,
    required this.address,
    required this.visitingHours,
    required this.ticketPrice,
    required this.description,
  });
}
