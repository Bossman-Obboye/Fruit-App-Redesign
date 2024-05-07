class EachFruit {
  final int index;
  final String name;
  final String image;
  final double price;
  final String description;

  EachFruit({
    required this.index,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  factory EachFruit.fromMyJson(Map<String, dynamic> json) {
    return EachFruit(
        index: json['index'],
        name: json['name'],
        image: json['image'],
        price: json['price'],
        description: json['description']);
  }
}

class AllFruit {
  final List<EachFruit> allFruits;

  AllFruit({required this.allFruits});

  factory AllFruit.fromMyJson(Map<String, dynamic> json) {
    List<dynamic> fruitsJson = json['fruits'];
    List<EachFruit> fruits = fruitsJson
        .map((fruitsJson) => EachFruit.fromMyJson(fruitsJson))
        .toList();
    return AllFruit(allFruits: fruits);
  }
}
