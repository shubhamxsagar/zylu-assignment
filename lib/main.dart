import 'package:employee/features/home/bloc/employee_bloc.dart';
import 'package:employee/features/home/screens/home_screen.dart';
import 'package:employee/repository/create_employee_repo.dart';
import 'package:employee/repository/get_employee_repo.dart';
import 'package:employee/route/MyAppRoute.dart';
import 'package:employee/themes/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

final myAppRouter = MyAppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => GetEmployee()),
        RepositoryProvider(create: (context) => CreateEmployeeRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => EmployeeBloc(
                    createEmployeeRepository:
                        RepositoryProvider.of<CreateEmployeeRepository>(
                            context),
                    getEmployee: RepositoryProvider.of<GetEmployee>(context),
                  )),
        ],
        child: MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightThemeMode,
          themeMode: ThemeMode.light,
          routerConfig: myAppRouter.router,
        ),
      ),
    );
  }
}
