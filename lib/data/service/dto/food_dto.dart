class FoodDTO {

  final String name;
  final String image;
  final String desc;

  FoodDTO(this.name, this.image, this.desc);

  factory FoodDTO.fromJson(dynamic json) {
    return FoodDTO(
        json['name'],
        json['image'],
        json['desc']
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['desc'] = desc;
    return map;
  }

}