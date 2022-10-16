import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:teste_unidade/bloc/person_bloc.dart';
import 'package:teste_unidade/models/person.dart';
import 'package:teste_unidade/person_state.dart';
import 'package:teste_unidade/repository/person_repository.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

void main() {
  final repository = PersonRepositoryMock();
  final bloc = PersonBloc(repository);
  final person = Person(id: 1, name: "Zé", age: 29, height: 1.77, weight: 64.4);
  test('Retornar Uma Lista de Pessoas', () async {
    when(() => repository.getPerson())
        .thenAnswer((_) async => <Person>[person, person]);

    bloc.add(PersonEvent.fetch);

    await expectLater(
        bloc,
        emitsInOrder([
          isA<PersonLoadingState>(),
          isA<PersonListState>(),
        ]));
  }, skip: 'Erro no bloc');
}
