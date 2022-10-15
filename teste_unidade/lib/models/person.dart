import 'dart:math' as match;

class Person {
  final String name;
  final int age;
  final double height;
  final double weight;

  Person({
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
}
