import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_foods/presenter/page/home/cubit/home_cubit.dart';
import 'package:list_foods/presenter/router/router.gr.dart';
import 'package:list_foods/injection.dart' as di;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.locator<HomeCubit>()
          ),
        ],
        child : MaterialApp.router(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        )
    );
  }
}
