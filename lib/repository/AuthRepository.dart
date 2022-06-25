import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../models/usuario.dart';

class AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthRepository({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  var usuarioatual;

  Stream<Usuario> get usuario {
    return _firebaseAuth.authStateChanges().map((firebaseusuario) {
      final usuario =
          firebaseusuario == null ? Usuario.vazio : firebaseusuario.toUser;
      return usuario;
    });
  }

  Future<void> cadastro(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (_) {}
  }

  Future<void> login_email_senha(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (_) {}
  }

  Future<void> logout() async {
   try{
    await Future.wait([_firebaseAuth.signOut()]);
   }catch(_){}
  }
}

extension on firebase_auth.User {
  Usuario get toUser {
    return Usuario(id: uid, email: email, nome: displayName, foto: photoURL);
  }
}
