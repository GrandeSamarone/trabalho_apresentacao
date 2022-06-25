

import 'package:bloc/bloc.dart';
import 'package:trabalho_apresentacao/cubit/cadastro/cadastro_state.dart';
import 'package:trabalho_apresentacao/repository/AuthRepository.dart';
import 'package:equatable/equatable.dart';

class CadastroCubit extends Cubit<CadastroState>{
final AuthRepository _authRepository;
  CadastroCubit(this._authRepository) : super(CadastroState.initial());

void emailChanged(String value){
  emit(
    state.copyWith(
      email:value,
      status:cadastroStatus.initial
    ),
  );
}

void passwordChanged(String value){
  emit(
    state.copyWith(
      password:value,
      status:cadastroStatus.initial
    ),
  );
}

Future<void> cadastroFormSubmitted() async{

  if(state.status == cadastroStatus.submitting) return;
  emit(state.copyWith(status:cadastroStatus.submitting ));
  try{
    await _authRepository.cadastro(email: state.email, password: state.password);
    emit(state.copyWith(status: cadastroStatus.sucess));
  }catch(_){}
}
}