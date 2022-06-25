import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_apresentacao/repository/AuthRepository.dart';
import 'package:trabalho_apresentacao/view/Cadastro_View.dart';

import '../cubit/login/login_cubit.dart';
import '../cubit/login/login_state.dart';


class Login extends StatelessWidget {
  //final formLoginKey = GlobalKey<FormState>();

   // static Page page()=> MaterialPage<void>(child: Login());

  @override
  Widget build(BuildContext context) {
        return Scaffold(
             body:BlocProvider(
            create:(_) =>LoginCubit(context.read<AuthRepository>()),
            child:LoginForm()
             ));
  }
}

class LoginForm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return BlocListener<LoginCubit,LoginState>(
     listener: (context, state) {
      if(state.status == LoginStatus.error){

      }
     },
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             alignment: Alignment.center,
             child: Image.asset(
               "imagens/iconmovie.png",
               width:100,
             ),

           ),
           const SizedBox(height: 16),
           const Text(
             "MegaFlix",
             style: TextStyle(
                 fontFamily: "Brand Bold",
                 color: Color(0xf2c83535),
                 fontSize: 34,
                 letterSpacing: 1,
                 fontWeight: FontWeight.w800),
           ),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Form(
               //  key:formLoginKey,
               child: Column(
                 children: [
                   _EmailInput(),
                   _PasswordField(),
                   const SizedBox(height: 16),
                   _LoginButton(),
                   const SizedBox(height: 16),
                   _CadastroButton(),
                 ],
               ),
             ),
           )
         ],
       )
   ) ;
  }

}
class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
         return  TextFormField(
             onChanged: (email){
               context.read<LoginCubit>().emailChanged(email);
             },
            decoration: const InputDecoration(
                labelText:"Email",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                icon: Icon(Icons.email,color: Colors.white,)
            ),
          );

      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password !=current.password,
      builder: (context, state) {
        return Container(
          width: size.width * 0.8,
          child: TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              contentPadding:
               EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              helperText: '''A senha deve ter pelo menos 8 caracteres com pelo menos uma letra e um número''',
              helperMaxLines: 2,
              labelText: 'Senha',
            ),
            onChanged: (password) {
              context.read<LoginCubit>().passwordChanged(password);
            },
          ),
        );
      },
    );
  }
}
class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status !=current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submitting?
        const CircularProgressIndicator()
        : Container(
          width:double.infinity,
          child: ElevatedButton(
            onPressed: (){
              context.read<LoginCubit>().loginWithCredentials();
            },
            child: const Text("Login"),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              shadowColor: Colors.transparent,
              textStyle:const TextStyle(
                  color: Colors.white54,
                  fontSize: 23,
                  fontFamily: "Brand Bold"
                  , fontWeight: FontWeight.bold
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CadastroButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child:const Text(
                "Não tem uma conta?",
                style: TextStyle(
                  color: Color(0xf2FDFDFD),
                  fontFamily: "Brand-Regular",
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CadastroView()),
                );
              },
              child: const Text(
                "Cadastre-se!",
                style: TextStyle(
                    color: Color(0xffc83535),
                    fontFamily: "Brand-Regular",
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        );

  }
}