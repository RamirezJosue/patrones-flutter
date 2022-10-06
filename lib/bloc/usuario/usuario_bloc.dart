import 'package:flutter/material.dart';
import 'package:patrones/models/usuario.dart';
import 'package:bloc/bloc.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc(): super(UsuarioInitialState()) {
    on<ActivarUsuario>((event, emit) => emit(UsuarioSetState(event.usuario)));
    on<EliminarUsuario>((event, emit) => emit(const UsuarioInitialState()));
    on<ChangeUserAge>((event, emit) {
      if(!state.existeUsuario) return;
      emit(UsuarioSetState(state.usuario!.copyWith(edad: event.edad)));
    });
     on<AgregarProfesion>((event, emit) {
      if(!state.existeUsuario) return;
      final professions = [ ...?state.usuario!.profesiones, event.profesion];
      emit(UsuarioSetState(state.usuario!.copyWith(profesiones: professions)));
    });
  }
}