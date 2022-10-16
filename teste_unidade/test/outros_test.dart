//@Skip('Teste não finalizado') // quando vc quer fazer um skip na switch inteira

import 'package:test/test.dart';

void main() {
  /*
  setUp(() {
    print('Inicia o teste');
  });

  tearDown(() {
    print('Destroi o teste');
  });

  setUpAll(() {
    print('Inicia a switch toda de teste');
  });

  tearDownAll(() {
    print('Destroi a switch toda de teste');
  });
  */
  test("Outros", () {
    final name = 'Marta';

    expect(name, isA<String>());
    expect(name, equals('Marta'));
    expect(name, isNotNull);
    expect(name, contains('Mar'));

    expect(
        name,
        allOf([
          isA<String>(),
          equals('Marta'),
          isNotNull,
          contains('Mar'),
        ]));
  });

  test('throw error', () {
    expect(() => int.parse('x'), throwsA(isA<Exception>()));
    expect(() => int.parse('x'), throwsException);
  });

  test("Timout", () {
    print('Timout');
  }, timeout: Timeout(const Duration(seconds: 60)));

  test(
    'Skip e Tag',
    () {
      var data = DateTime(2022);
      expect(data.year, 2022);
    },
    skip:
        'Falta verificar as regras', //informa que o teste não deve ser executado ainda e o motivo
    tags: 'mobile', //usanddo tags para organizar os teste por tags
  );
}
