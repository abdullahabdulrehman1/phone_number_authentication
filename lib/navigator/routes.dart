import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_authentication/cubit/auth_cubit/auth_cubit.dart';
import 'package:phone_number_authentication/pages/first_page.dart';
import 'package:phone_number_authentication/pages/home_screen.dart';
import 'package:phone_number_authentication/pages/otp_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/first":
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: HomeScreen(),
                )));

      case "/otp":
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: OtpScreen(),
                )));
      case "/mainpage":
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: FirstPage(),
                )));
      default:
        return null;
    }
  }
}
