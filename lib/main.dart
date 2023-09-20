import 'package:chat/l10n/l10n.dart';
import 'package:chat/parts/theme_selector/theme_selector_part.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/material.dart';
import 'package:chat/parts/login/login_part.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(
        themeRepository: ThemeRepository(),
      )..loadSavedTheme(),
      child: BlocBuilder<ThemeCubit, ThemeType>(
        builder: (context, state) => MaterialApp(
          theme: context.readThemeCubit.theme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginScreen(),
          ),
        ),
      ),
    );
  }
}
