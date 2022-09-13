class User {
  final String id;
  final String name;
  final String number;
  final String image;
  
  User(
      {this.id = '',
      required this.name,
      required this.number,
      required this.image});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      "name": name,
      "number": number.toString(),
      'image': image
    };
  }

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      image: json['image']);
}
