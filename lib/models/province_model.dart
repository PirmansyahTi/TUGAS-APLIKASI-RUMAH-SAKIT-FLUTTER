class ProvinceModel {
  final List<Province>? provinces;

  ProvinceModel({this.provinces});

  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    var list = json['provinces'] as List;
    List<Province> provinceList =
        list.map((i) => Province.fromJson(i)).toList();

    return ProvinceModel(provinces: provinceList);
  }
}

class Province {
  final String id;
  final String name;

  Province({required this.id, required this.name});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      id: json['id'],
      name: json['name'],
    );
  }
}
