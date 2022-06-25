import 'package:equatable/equatable.dart';
import 'package:trabalho_apresentacao/models/usuario.dart';

enum AppStatus{authenticado,naoathenticado}

class AppState extends Equatable{
final AppStatus status;
final Usuario usuario;

  const AppState._({
  required this.status,
  this.usuario=Usuario.vazio
});

  const AppState.authenticado(Usuario usuario)
      :this._(status: AppStatus.authenticado,usuario: usuario);

  const AppState.naoathenticado()
      :this._(status: AppStatus.naoathenticado);

  @override
  List<Object?> get props => [status,usuario];
}