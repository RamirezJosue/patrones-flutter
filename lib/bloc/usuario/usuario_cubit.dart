import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:patrones/models/usuario.dart';

part 'usuarios_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit(): super(UsuarioInitial());

  void seleccionarUsuario (Usuario user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentSate = state;
    if (currentSate is UsuarioActivo) {
      // currentSate.usuario.edad = edad;
      // emit(UsuarioActivo(currentSate.usuario));
      final newUser = currentSate.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }
  
  void agregarProfesion() {
    final currentSate = state;
    if (currentSate is UsuarioActivo) {
      final newProfesiones = [
        ...?currentSate.usuario.profesiones,
        'Profesión ${ currentSate.usuario.profesiones!.length + 1}'
      ];
      final newUser = currentSate.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}