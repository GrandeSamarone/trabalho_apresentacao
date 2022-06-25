 import 'package:equatable/equatable.dart';

class Usuario extends Equatable{
  final String id;
  final String? email;
  final String? nome;
  final String? foto;

  const Usuario({required this.id,this.email,this.nome,this.foto});


  static const  vazio =Usuario(id:'');

  bool get estavazio => this == Usuario.vazio;
  bool get naovazio => this != Usuario.vazio;

  @override
  List<Object?> get props => [id,email,nome,foto];
}