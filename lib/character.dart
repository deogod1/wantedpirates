class Character {
  final String image;
  final String name;
  final List<String> recomend;
  final List<String> link;

  Character(this.image, this.name, this.recomend, this.link);

  factory Character.fromMap(Map<String, dynamic> mapa) {
    final recommendations = mapa["recomendations"] as List;
    final links = mapa["link"] as List;
    final linksString = links.map((e) => e.toString()).toList();
    final recommendationsString =
        recommendations.map((e) => e.toString()).toList();
    return Character(
        mapa["image"], mapa["name"], recommendationsString, linksString);
  }

  static List<Character> listFromSource(List<dynamic> list) {
    return list.map((e) => Character.fromMap(e)).toList();
  }
}
