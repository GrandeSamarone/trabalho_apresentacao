import 'package:equatable/equatable.dart';
import 'package:trabalho_apresentacao/models/usuario.dart';

abstract class AppEvent extends Equatable{
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppLogoutRequested extends AppEvent{
}

class AppUsuarioAlterar extends AppEvent{
  final Usuario usuario;

  const AppUsuarioAlterar(this.usuario);

  @override
  List<Object?> get props => [usuario];
}