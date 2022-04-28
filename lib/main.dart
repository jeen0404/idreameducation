import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idream/features/app_start/splash_screen.dart';
import 'core/route/app_route.dart';
import 'core/route/auth_app_route.dart';
import 'features/app_start/controllers/app_start_cubit.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppStartCubit _appStartCubit = AppStartCubit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppStartCubit>(
        create: (context) => _appStartCubit,
        child: BlocBuilder<AppStartCubit, AppStartCubitState>(
          bloc: _appStartCubit,
          builder: (context, state) {
            if (state is AuthenticatedAppStartCubitState) {
              return  Authenticated(route: state.route,);
            } else if (state is UnAuthenticatedAppStartCubitState) {
              return const UnAuthenticated();
            } else {
              _appStartCubit.loadResources();
              return const SplashScreenApp();
            }
          },
        ));
  }
}

// UnAuthenticated MaterialApp
class UnAuthenticated extends StatelessWidget {
  const UnAuthenticated({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Currency',
        debugShowCheckedModeBanner:
            false, // removing debuging banner  // app title
        // Theme
        theme: ThemeData.light(), // flutter defult light themedata
        onGenerateRoute:(routeSettings)=> authappRoute(routeSettings),
        );
        
  }
}

// AuthenticatedApp or main app
class Authenticated extends StatelessWidget {
  late final String route;
   Authenticated({Key? key,this.route='/'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'teleduce',
      debugShowCheckedModeBanner:
          false, // removing debuging banner  // app title
      // Theme
      theme: ThemeData.light().copyWith(
          appBarTheme: ThemeData.light().appBarTheme.copyWith(
              color: ThemeData.light().scaffoldBackgroundColor,
              iconTheme: ThemeData.light().iconTheme,
              elevation: 0.2),
          tabBarTheme: ThemeData.light()
              .tabBarTheme
              .copyWith(labelColor: ThemeData.light().colorScheme.onSurface)),
              initialRoute: route,
     
      onGenerateRoute:(routeSettings)=> appRoute(routeSettings),
    );
  }
}

// Splash screen app
class SplashScreenApp extends StatelessWidget {
  const SplashScreenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Currency',
        debugShowCheckedModeBanner:
            false, // removing debuging banner  // app title
        // Theme
        theme: ThemeData.light(), // flutter defult light themedata
        // darkTheme: ThemeData.dark(), // flutter defult dark theme for dark mode
        home: const SplashScreen());
  }
}
