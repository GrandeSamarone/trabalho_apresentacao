import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_apresentacao/app/app_bloc.dart';
import 'package:trabalho_apresentacao/repository/AuthRepository.dart';
import 'package:trabalho_apresentacao/view/Splash_View.dart';

import 'AppBlocObserver.dart';


void main() {
  return BlocOverrides.runZoned(()
  async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final authrepository = AuthRepository();
    runApp(MyApp(authRepository:authrepository));
  },
  blocObserver: AppBlocObserver(),);
}

class MyApp extends StatelessWidget {

  final AuthRepository _authRepository;
  const MyApp({Key? key,
  required AuthRepository authRepository}) : _authRepository=authRepository, super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return RepositoryProvider.value(value: _authRepository,
    child: BlocProvider(create: (_) =>
        AppBloc(authRepository: _authRepository),
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFF403939),
        cardColor:const Color(0xFF403939),
        canvasColor:const Color(0xFF403939),
      ),
      home: Splash_View()
    ),
    ),
    );

  }
}

