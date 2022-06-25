

import 'package:equatable/equatable.dart';

enum cadastroStatus{initial,submitting,sucess,error}

class CadastroState extends Equatable{

  final String email;
  final String password;
  final cadastroStatus status;

 const CadastroState({
    required this.email,
    required this.password,
    required this.status
});

 factory CadastroState.initial(){
   return const CadastroState(
     email:'',
     password:'',
     status:cadastroStatus.initial,
   );
 }

 CadastroState copyWith({
 String ? email,
  String ? password,
   cadastroStatus ? status,
}){
   return CadastroState(email: email ?? this.email, password: password ?? this.password, status: status ?? this.status);
 }

  @override
  List<Object?> get props => [email,password,status];


}