import 'package:bloc/bloc.dart';
import 'package:teste_unidade/person_state.dart';
import 'package:teste_unidade/repository/person_repository.dart';

enum PersonEvent { clear, fetch }

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc(this.repository) : super(PersonListState([]));

  final PersonRepository repository;

  @override
  Stream<PersonState> mapEventToState(PersonEvent event) async* {
    if (event == PersonEvent.clear) {
      yield PersonListState([]);
    } else {
      yield PersonLoadingState();
      try {
        final list = await repository.getPerson();
        yield PersonListState(list);
      } catch (e) {
        yield PersonErrorState(e);
      }
    }
  }
}
