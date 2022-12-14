import 'package:arrow_dating_app/blocs/swipe/swipe_bloc.dart';
import 'package:arrow_dating_app/config/app_router.dart';
import 'package:arrow_dating_app/config/theme.dart';
import 'package:arrow_dating_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/models.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SwipeBloc()..add(LoadUsersEvent(users: User.users)),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: ((context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "ARROW",
            theme: theme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: MatchesScreen.routeName,
          );
        }),
      ),
    );
  }
}
