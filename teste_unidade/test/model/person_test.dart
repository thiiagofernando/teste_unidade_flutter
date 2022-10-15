import 'package:test/test.dart';
import 'package:teste_unidade/models/person.dart';

void main() {
  final person = Person(name: "Zé", age: 29, height: 1.77, weight: 64.4);

  test("IMC deve ser 20.56", () {
    expect(person.imc, 20.56);
  });

  group("Maior De Idade | ", () {
    test("Se a Idade for maior de 18 deve retornar true na consulta", () {
      expect(person.maiorDeIdade, true);
    });

    test("Se a Idade for menor de 18 deve retornar false na consulta", () {
      final person = Person(name: "Zé", age: 12, height: 1.77, weight: 64.4);
      expect(person.maiorDeIdade, false);
    });
  });
}
