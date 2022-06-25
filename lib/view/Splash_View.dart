import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/app_bloc.dart';
import '../repository/AuthRepository.dart';
import 'Login_View.dart';


class Splash_View extends StatelessWidget{
  final authrepository = AuthRepository();

  initialize(BuildContext context) async {
      Navigator.of(context).push(
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 1500),
            maintainState: true,
            pageBuilder: (c, a1, a2) {
              return Login();
            }),
      );
    // RepositoryProvider.value(value: authrepository,
    //     child: BlocProvider(create: (_) =>
    //     AppBloc(authRepository: authrepository)));
    //
    // AppStatus state
    // await reloadUser();
    //
    // if (!isLogged()) {
    //   Navigator.of(context).push(
    //     PageRouteBuilder(
    //         transitionDuration: Duration(milliseconds: 1500),
    //         maintainState: true,
    //         pageBuilder: (c, a1, a2) {
    //           return Login();
    //         }),
    //   );
    // }else{
    //   Navigator.of(NavigationService.navigatorKeyGlobal.currentContext!).pushReplacementNamed('/main_view');
    // }

  }



  @override
  Widget build(BuildContext context) {

    Future.delayed( const Duration(milliseconds: 2000), () async {
      initialize(context);
    });
    return  Scaffold(
      backgroundColor:const Color(4279900442),
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          "imagens/iconmovie.png",
          width:200,
        ),
      )
    );
  }
}
