import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopora/core/config/localization/app_localization.dart';
import 'package:shopora/core/config/themes/theme_data/theme_data_dark.dart';
import 'package:shopora/core/config/themes/theme_data/theme_data_light.dart';
import 'package:shopora/features/auth/login/presentation/view/login_screen.dart';
import 'package:shopora/features/auth/sign_up/presentation/view/sign_up_screen.dart';
import 'package:shopora/features/switch_locale/presentation/view_model/cubit/switch_locale_cubit.dart';
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

  Widget _buildMaterialApp(BuildContext context, ThemeMode themeMode, Locale locale) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          ////disable debug banner
          debugShowCheckedModeBanner: false,

          ///localization 
          locale: locale,
          localizationsDelegates: AppLocalization.localizationsDelegates,
          supportedLocales: AppLocalization.supportedLocalesList,

          ///theme
          theme: getlightTheme(),
          darkTheme: getdarkTheme(),
          themeAnimationCurve: Curves.easeInOut,
          themeAnimationDuration: const Duration(milliseconds: 500),
          themeMode: themeMode,

          ///home
          home: child,
        );
      },
      child: LoginScreen(),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => SwitchlocaleCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return BlocBuilder<SwitchlocaleCubit, Locale>(
            builder: (context, locale) {
              return _buildMaterialApp(context, themeMode, locale);
            },
          );
        },
      ),
    );
  }
}
