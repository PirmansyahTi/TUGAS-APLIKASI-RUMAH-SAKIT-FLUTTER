class HospitalMapModel {
 
  final String id;
  final String name;

  HospitalMapModel({required this.id, required this.name});

  factory HospitalMapModel.fromJson(Map<String, dynamic> json) {
    return HospitalMapModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
