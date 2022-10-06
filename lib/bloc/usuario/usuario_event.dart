part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioEvent {}

class ActivarUsuario extends UsuarioEvent {
  final Usuario usuario;
  ActivarUsuario(this.usuario);
}

class ChangeUserAge extends UsuarioEvent {
  final int edad;
  ChangeUserAge(this.edad);
}

class AgregarProfesion extends UsuarioEvent {
  final String profesion;
  AgregarProfesion(this.profesion);
}

class EliminarUsuario extends UsuarioEvent {}