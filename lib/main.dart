// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sqin_task/app_module.dart';
// // import 'package:tv_maze/arguments/show_arguments.dart';
// import 'package:sqin_task/bloc/episode/episode_bloc.dart';
// import 'package:sqin_task/bloc/season/season_bloc.dart';
// import 'package:sqin_task/bloc/show/auth_bloc.dart';
// import 'package:sqin_task/dependency_injection.dart';
// import 'package:sqin_task/services/episode_service.dart';
// import 'package:sqin_task/services/season_service.dart';
// import 'package:sqin_task/services/show_service.dart';
//
// import 'layers/presentation/pages/listing_page.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initializeDependencyInjection();
//   return runApp(ModularApp(module: AppModule(), child: const AppState()));
// }
//
// ///State of the app. Represents where the blocs are confugured.
// class AppState extends StatelessWidget {
//   ///constructor
//   const AppState({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       // ignore: always_specify_types
//       providers: [
//         BlocProvider<ShowBloc>(create: (_) => ShowBloc(di<ShowService>())),
//         BlocProvider<SeasonBloc>(
//             create: (_) => SeasonBloc(di<SeasonService>())),
//         BlocProvider<EpisodeBloc>(
//             create: (_) => EpisodeBloc(di<EpisodeService>())),
//       ],
//       child: ScreenUtilInit(
//           designSize: const Size(360, 690),
//           builder: (BuildContext context, Widget? child) {
//             return MaterialApp(
//               title: 'Flutter Demo',
//               theme: ThemeData(
//                 primarySwatch: Colors.orange,
//               ),
//               //onGenerateRoute: onGenerateRoute,
//               home: const ListingPage(),
//             );
//           }
//       ),
//     );
//   }
// }
//
// ///Main app for the Maze Tv app
// class TvMazeApp extends StatelessWidget {
//   ///constructor
//   const TvMazeApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       title: 'TV Maze',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       routeInformationParser: Modular.routeInformationParser,
//       routerDelegate: Modular.routerDelegate,
//     );
//   }
// }



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sqin_task/layers/presentation/bloc/favorite/fav_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/favorite_listing/fav_list_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/people_bloc/people_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/season/season_bloc.dart';
import 'package:sqin_task/layers/presentation/bloc/show/show_bloc.dart';
import 'package:sqin_task/layers/presentation/pages/home_screen.dart';
import 'package:sqin_task/layers/presentation/pages/login_screen.dart';
import 'package:sqin_task/layers/presentation/pages/splash_Screen.dart';
import 'injection.dart' as di;
import 'layers/presentation/bloc/authentication_bloc/auth_bloc.dart';
import 'layers/presentation/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShowBloc>(create: (_) => di.locator<ShowBloc>()),
        BlocProvider<SeasonBloc>(create: (_) => di.locator<SeasonBloc>()),
        BlocProvider<FavoriteBloc>(create: (_) => di.locator<FavoriteBloc>()),
        BlocProvider<PeopleBloc>(create: (_) => di.locator<PeopleBloc>()),
        BlocProvider<FavoriteListBloc>(create: (_) => di.locator<FavoriteListBloc>()),
        BlocProvider<AuthBloc>(create: (_) => di.locator<AuthBloc>()),


      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.orange,
              ),
              onGenerateRoute: onGenerateRoute,
              home:  SplashScreen(),
            );
          }
      ),
    );
  }
}
