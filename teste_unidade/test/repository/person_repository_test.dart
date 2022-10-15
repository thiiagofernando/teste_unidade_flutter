import 'package:http/http.dart' as http;
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:teste_unidade/models/person.dart';
import 'package:teste_unidade/repository/person_repository.dart';
import 'package:mocktail/mocktail.dart';

class ClientMok extends Mock implements http.Client {}

void main() {
  final client = ClientMok();
  final repositorio = PersonRepository(client);
  late List<Person> list;

  setUpAll(() {
    registerFallbackValue(Uri.parse('www.localhost.com.br'));
  });
  test(
    'Obter Lista de Pessoas na API',
    () async {
      when(() => client.get(any()))
          .thenAnswer((_) async => http.Response(jsonMockRetorno, 200));

      list = await repositorio.getPerson();

      expect(list.isNotEmpty, equals(true));
      expect(list.length, greaterThan(0));
      expect(list.first.name.toLowerCase(), 'name 1');
    },
  );

  test(
    'Retornar um exception se não for status code 200',
    () async {
      when(() => client.get(any()))
          .thenAnswer((_) async => http.Response(jsonMockRetorno, 404));

      expect(() async => await repositorio.getPerson(), throwsException);
    },
  );
}

const jsonMockRetorno =
    '[{"name":"name 1","age":50,"height":67,"weight":67,"id":"1"},{"name":"name 2","age":11,"height":11,"weight":62,"id":"2"},{"name":"name 3","age":52,"height":22,"weight":51,"id":"3"},{"name":"name 4","age":21,"height":88,"weight":54,"id":"4"},{"name":"name 5","age":75,"height":32,"weight":43,"id":"5"},{"name":"name 6","age":97,"height":48,"weight":12,"id":"6"},{"name":"name 7","age":84,"height":37,"weight":6,"id":"7"},{"name":"name 8","age":73,"height":76,"weight":89,"id":"8"},{"name":"name 9","age":48,"height":54,"weight":54,"id":"9"},{"name":"name 10","age":21,"height":83,"weight":7,"id":"10"},{"name":"name 11","age":79,"height":15,"weight":97,"id":"11"},{"name":"name 12","age":62,"height":35,"weight":6,"id":"12"},{"name":"name 13","age":68,"height":28,"weight":18,"id":"13"},{"name":"name 14","age":78,"height":9,"weight":4,"id":"14"},{"name":"name 15","age":14,"height":98,"weight":70,"id":"15"},{"name":"name 16","age":45,"height":83,"weight":86,"id":"16"},{"name":"name 17","age":44,"height":51,"weight":38,"id":"17"},{"name":"name 18","age":5,"height":35,"weight":11,"id":"18"},{"name":"name 19","age":66,"height":52,"weight":84,"id":"19"},{"name":"name 20","age":9,"height":16,"weight":19,"id":"20"},{"name":"name 21","age":50,"height":8,"weight":16,"id":"21"},{"name":"name 22","age":76,"height":2,"weight":56,"id":"22"},{"name":"name 23","age":80,"height":28,"weight":90,"id":"23"},{"name":"name 24","age":40,"height":60,"weight":61,"id":"24"},{"name":"name 25","age":76,"height":15,"weight":48,"id":"25"},{"name":"name 26","age":87,"height":48,"weight":67,"id":"26"},{"name":"name 27","age":78,"height":36,"weight":94,"id":"27"},{"name":"name 28","age":56,"height":30,"weight":48,"id":"28"},{"name":"name 29","age":83,"height":18,"weight":64,"id":"29"},{"name":"name 30","age":65,"height":52,"weight":57,"id":"30"},{"name":"name 31","age":19,"height":63,"weight":23,"id":"31"},{"name":"name 32","age":81,"height":4,"weight":59,"id":"32"},{"name":"name 33","age":55,"height":3,"weight":90,"id":"33"},{"name":"name 34","age":95,"height":50,"weight":85,"id":"34"},{"name":"name 35","age":82,"height":21,"weight":41,"id":"35"},{"name":"name 36","age":29,"height":48,"weight":18,"id":"36"},{"name":"name 37","age":88,"height":73,"weight":36,"id":"37"},{"name":"name 38","age":81,"height":67,"weight":77,"id":"38"},{"name":"name 39","age":26,"height":32,"weight":27,"id":"39"},{"name":"name 40","age":82,"height":18,"weight":61,"id":"40"},{"name":"name 41","age":57,"height":83,"weight":14,"id":"41"},{"name":"name 42","age":58,"height":29,"weight":82,"id":"42"},{"name":"name 43","age":21,"height":25,"weight":5,"id":"43"},{"name":"name 44","age":77,"height":94,"weight":47,"id":"44"},{"name":"name 45","age":35,"height":76,"weight":87,"id":"45"},{"name":"name 46","age":53,"height":49,"weight":58,"id":"46"},{"name":"name 47","age":62,"height":4,"weight":2,"id":"47"},{"name":"name 48","age":3,"height":91,"weight":70,"id":"48"},{"name":"name 49","age":56,"height":49,"weight":1,"id":"49"},{"name":"name 50","age":69,"height":17,"weight":19,"id":"50"}]';
