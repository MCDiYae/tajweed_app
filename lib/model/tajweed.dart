class Tajweed {
  final int id;
  final String title;
  final String image;
  final String definition;

  Tajweed({
    required this.id,
    required this.title,
    required this.image,
    required this.definition,
  });

  // Factory method to create a Tajweed object from a JSON map
  factory Tajweed.fromJson(Map<String, dynamic> json) {
    return Tajweed(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      definition: json['definition'],
    );
  }

  // Method to convert a Tajweed object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'title': title,
      'image': image,
      'definition': definition,
    };
  }
}
