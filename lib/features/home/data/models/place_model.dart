class Place {
  final String id;
  final String name;
  final String description;
  final String governorate;
  final String region;
  final String address;
  final String availableForVisit;
  final String visitingHours;
  final String ticketPrice;
  final List<String> images;
  final double lat;
  final double lon;
  final double distance;
  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.governorate,
    required this.region,
    required this.address,
    required this.availableForVisit,
    required this.visitingHours,
    required this.ticketPrice,
    required this.images,
    required this.lat,
    required this.lon,
    required this.distance,
  });
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      governorate: json['gov'] ?? '',
      region: json['region'] ?? '',
      address: json['address'] ?? '',
      availableForVisit: json['is_available'] ?? '',
      visitingHours: json['visit_times'] ?? '',
      ticketPrice: json['ticket_price'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      lat: (json['lat'] is String)
          ? double.tryParse(json['lat']) ?? 0.0
          : json['lat']?.toDouble() ?? 0.0,
      lon: (json['long'] is String)
          ? double.tryParse(json['long']) ?? 0.0
          : json['long']?.toDouble() ?? 0.0,
      distance: json['distance']?.toDouble() ?? 0.0,
    );
  }
}