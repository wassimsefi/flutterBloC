import 'package:bloc/bloc.dart';
import 'package:flutterbloc/data/models/characters.dart';
import 'package:flutterbloc/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/quota.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> myCharacters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      myCharacters = characters;
    });
    return myCharacters;
  }

  void getQuotes(String charName) {
    charactersRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
}
