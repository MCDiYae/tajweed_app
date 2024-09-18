class Tajweed {
  final String title;
  final String image;
  final String definition;

  Tajweed({
    required this.title,
    required this.image,
    required this.definition,
  });

  // Factory method to create a Tajweed object from a JSON map
  factory Tajweed.fromJson(Map<String, dynamic> json) {
    return Tajweed(
      title: json['title'],
      image: json['image'],
      definition: json['definition'],
    );
  }

  // Method to convert a Tajweed object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'definition': definition,
    };
  }
}
