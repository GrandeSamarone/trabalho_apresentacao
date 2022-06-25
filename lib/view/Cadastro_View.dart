import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_apresentacao/cubit/cadastro/cadastro_cubit.dart';
import 'package:trabalho_apresentacao/cubit/cadastro/cadastro_state.dart';
import 'package:trabalho_apresentacao/repository/AuthRepository.dart';
import 'package:trabalho_apresentacao/view/Cadastro_View.dart';

import '../cubit/login/login_cubit.dart';
import '../cubit/login/login_state.dart';


class CadastroView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocProvider(
            create:(_) =>CadastroCubit(context.read<AuthRepository>()),
            child:CadastroForm()
        ));
  }
}

class CadastroForm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocListener<CadastroCubit,CadastroState>(
        listener: (context, state) {
          if(state.status == cadastroStatus.error){

          }
        },
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Cadastre-se",
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
                _CadastroButton(),
                const SizedBox(height: 16),
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
    return BlocBuilder<CadastroCubit, CadastroState>(
      builder: (context, state) {
        return  TextFormField(
          onChanged: (email){
            context.read<CadastroCubit>().emailChanged(email);
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
    return BlocBuilder<CadastroCubit,CadastroState>(
      buildWhen: (previous, current) => previous.password !=current.password,
      builder: (context, state) {
        return Container(
          width: size.width * 0.8,
          child: TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              labelText: 'Senha',
            ),
            onChanged: (password) {
              context.read<CadastroCubit>().passwordChanged(password);
            },
          ),
        );
      },
    );
  }
}
class _CadastroButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CadastroCubit, CadastroState>(
      buildWhen: (previous, current) => previous.status !=current.status,
      builder: (context, state) {
        return state.status == cadastroStatus.submitting?
        const CircularProgressIndicator()
            : Container(
          width:double.infinity,
          child: ElevatedButton(
            onPressed: (){
              context.read<CadastroCubit>().cadastroFormSubmitted();
            },
            child: const Text("Cadastre-se"),
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