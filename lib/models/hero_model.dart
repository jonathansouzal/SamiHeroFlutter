class SuperheroModel {
  final String name;
  final Map<String, dynamic> powerStats;
  final Map<String, dynamic> biography;
  final String image_url;
  SuperheroModel(
      {required this.name,
      required this.powerStats,
      required this.biography,
      required this.image_url});

  factory SuperheroModel.fromJson(Map<String, dynamic> json) {
    return SuperheroModel(
        biography: json['biography'],
        powerStats: json['powerstats'],
        name: json["name"],
        image_url: json['image']);
  }
}
