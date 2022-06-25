
import 'package:bloc/bloc.dart';
import 'package:trabalho_apresentacao/repository/AuthRepository.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{

  final AuthRepository _authRepository;
  LoginCubit(this._authRepository) : super(LoginState.initial());

  void emailChanged(String value){
    emit(state.copyWith(email: value,status: LoginStatus.initial));
  }
  void passwordChanged(String value){
    emit(state.copyWith(password:value,status: LoginStatus.initial));
  }

  Future<void> loginWithCredentials()async{
    if(state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try{
      await _authRepository.login_email_senha(email: state.email, password: state.password);
      emit(state.copyWith(status: LoginStatus.sucess));
    }catch(_){}

  }
}