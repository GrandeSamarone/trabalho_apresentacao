
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:trabalho_apresentacao/app/app_event.dart';
import 'package:trabalho_apresentacao/app/app_state.dart';
import 'package:trabalho_apresentacao/models/usuario.dart';

import '../repository/AuthRepository.dart';

class AppBloc extends Bloc<AppEvent,AppState>{
  final AuthRepository _authRepository;
  StreamSubscription<Usuario>? _usuarioSubscription;

  AppBloc({required AuthRepository authRepository}) :
        _authRepository=authRepository,
        super(authRepository.usuarioatual.isNotEmpty
          ? AppState.authenticado(authRepository.usuarioatual)
          : const AppState.naoathenticado()) {

    on<AppUsuarioAlterar>(_onUsuarioAlterar);
    on<AppLogoutRequested>(_onLogoutRequest);
  }

void _onUsuarioAlterar(AppUsuarioAlterar event, Emitter<AppState> emit,){
    emit(
        event.usuario.naovazio ? AppState.authenticado(event.usuario)
        :const AppState.naoathenticado());



}
void _onLogoutRequest(AppLogoutRequested event, Emitter<AppState> emit,){
     unawaited(_authRepository.logout());
}

}