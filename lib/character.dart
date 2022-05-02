class Character {
  final String image;
  final String name;
  final List<String> recomend;
  final String link;

  Character(this.image, this.name, this.recomend, this.link);

  factory Character.fromMap(Map<String, dynamic> mapa) {
    final recommendations = mapa["recomendations"] as List;
    final recommendationsString =
        recommendations.map((e) => e.toString()).toList();
    return Character(
        mapa["image"], mapa["name"], recommendationsString, mapa["link"]);
  }

  static List<Character> listFromSource(List<dynamic> list) {
    return list.map((e) => Character.fromMap(e)).toList();
  }
}
