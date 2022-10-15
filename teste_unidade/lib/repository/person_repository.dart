import 'dart:convert';

import 'package:http/http.dart';
import 'package:teste_unidade/models/person.dart';

class PersonRepository {
  final Client client;

  PersonRepository(this.client);

  Future<List<Person>> getPerson() async {
    final response = await client
        .get(Uri.parse('https://634b059633bb42dca40f8d02.mockapi.io/person'));

    if (response.statusCode == 200) {
      final jsonlist = jsonDecode(response.body) as List;
      return jsonlist.map((e) => Person.fromMap(e)).toList();
    } else {
      throw Exception('Erro na internet');
    }
  }
}
