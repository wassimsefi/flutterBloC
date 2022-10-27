import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/business_logic/cubit/characters_cubit.dart';
import 'package:flutterbloc/constants/strings.dart';
import 'package:flutterbloc/data/repository/characters_repository.dart';
import 'package:flutterbloc/data/web_services/characters_web_services.dart';
import 'package:flutterbloc/presentation/screens/characters_details.dart';
import 'package:flutterbloc/presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case charactersDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const CharactersDetailsScreen(),
        );
    }
    return null;
  }
}
