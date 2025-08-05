import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopora/core/config/themes/theme_data/theme_data_dark.dart';
import 'package:shopora/core/config/themes/theme_data/theme_data_light.dart';
import 'package:shopora/features/auth/login/presentation/view/login_screen.dart';
import 'package:shopora/features/switch_theme/presentation/view_model/cubit/theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const Shopora());
}

class Shopora extends StatelessWidget {
  const Shopora({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {


          return MaterialApp(
            theme: getlightTheme(),
            darkTheme: getdarkTheme(),
            themeMode: themeMode,



            home: LoginScreen(),
          );
        },
      ),
    );
  }
}
