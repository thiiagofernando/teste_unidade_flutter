import 'dart:convert';
import 'dart:math' as match;

class Person {
  final int id;
  final String name;
  final int age;
  final double height;
  final double weight;

  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
  });

  double get imc {
    var result = weight / match.pow(height, 2);
    result = result * 100;
    return result.roundToDouble() / 100;
  }

  bool get maiorDeIdade {
    return age >= 18;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: int.parse(map['id']),
      name: map['name'] as String,
      age: map['age'] as int,
      height: map['height'] * 1.0,
      weight: map['weight'] * 1.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) =>
      Person.fromMap(json.decode(source) as Map<String, dynamic>);
}
