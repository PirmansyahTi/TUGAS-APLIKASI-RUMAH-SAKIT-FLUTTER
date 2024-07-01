class HospitalModel {
  final List<Hospital>? hospitals;

  HospitalModel({this.hospitals});

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    var list = json['hospitals'] as List;
    List<Hospital> hospitalList =
        list.map((i) => Hospital.fromJson(i)).toList();

    return HospitalModel(hospitals: hospitalList);
  }
}

class Hospital {
  final String name;
  final String address;

  Hospital({required this.name, required this.address});

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      name: json['name'],
      address: json['address'],
    );
  }

  get id => null;
}
