import 'dart:async';

import 'package:expense_repository/expense_repository.dart';
import 'package:petagram/screens/auth/Login.dart';
import 'package:petagram/screens/auth/LoginBloc.dart';
import 'package:petagram/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/blocs/get_expenses_bloc/get_expenses_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => LoginBloc(),
              child: LoginScreen(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    // final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
              height: height * .4,
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Center(
            child: Text(
              'ExPect',
              style: TextStyle(
                letterSpacing: .6,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
