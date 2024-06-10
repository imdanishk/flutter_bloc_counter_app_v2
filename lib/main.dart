import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_counter_app_v2/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_counter_app_v2/presentation/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings) {
          // Generate route with appropriate arguments
          if (settings.name == '/second') {
            return _appRouter.onGenerateRoute(
              RouteSettings(
                name: settings.name,
                arguments: GlobalKey<ScaffoldMessengerState>(),
              ),
            );
          }
          return _appRouter.onGenerateRoute(settings);
        },
      ),
    );
  }
}
