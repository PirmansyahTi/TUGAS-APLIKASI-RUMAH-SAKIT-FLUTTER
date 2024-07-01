class BedDetailModel {
  // Define the fields and fromJson method
  // Example:
  final String id;
  final String name;

  BedDetailModel({required this.id, required this.name});

  factory BedDetailModel.fromJson(Map<String, dynamic> json) {
    return BedDetailModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
