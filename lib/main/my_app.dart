import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_flutter/data/datasources/network/datasource_ntw_db.dart';
import 'package:interview_flutter/data/repositories/autocomplete_ropository_impl.dart';
import 'package:interview_flutter/data/repositories/location_repository_impl.dart';
import 'package:interview_flutter/shared/res/app_strings.dart';
import 'package:interview_flutter/shared/routes/app_routes.dart';
import 'package:interview_flutter/shared/theme/app_theme.dart';
import 'package:interview_flutter/ui/providers/auto_complete_bloc/auto_complete_bloc.dart';
import 'package:interview_flutter/ui/providers/location_bloc/location_bloc.dart';
import 'package:interview_flutter/ui/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => AutoCompleteBloc(
            autocompleteRepositoy: AutocompleteRopositoryImpl(
              datasourceNtwDb: DatasourceNtwDb(
                dio: Dio(),
              ),
            ),
          ),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => LocationBloc(
            locationRepository: LocationRepositoryImpl(
              datasourceNtwDb: DatasourceNtwDb(
                dio: Dio(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        title: AppStrings.appBarTitle,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AppRoutes.home:
              return MaterialPageRoute(
                  builder: (context) => const HomeScreen());
            default:
              return MaterialPageRoute(
                  builder: (context) => const HomeScreen());
          }
        },
      ),
    );
  }
}
