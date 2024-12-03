class Destination {
  final String name;
  final String description;
  final String description2;
  final String imageUrl;
  bool isFavorite;

  Destination({
    required this.name,
    required this.description,
    required this.description2,
    required this.imageUrl,
    this.isFavorite = false,
  });

  // Método para converter um destino para JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'description2': description2,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }

  // Método para criar um destino a partir de JSON
  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      name: json['name'],
      description: json['description'],
      description2: json['description2'],
      imageUrl: json['imageUrl'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  // Método para criar uma cópia do destino com valores modificados
  Destination copyWith({bool? isFavorite}) {
    return Destination(
      name: name,
      description: description,
      description2: description2,
      imageUrl: imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
