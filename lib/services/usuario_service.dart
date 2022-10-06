import 'package:flutter/material.dart';
import 'package:patrones/models/usuario.dart';

class UsuarioService with ChangeNotifier {
  Usuario _usuario = Usuario(nombre: '', edad: null, profesiones: []);

  Usuario get usuario => _usuario;
  bool get existeUsuario => _usuario.edad != null ? true: false;

  set usuario(Usuario user) {
    _usuario = user;
    notifyListeners();
  } 

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    _usuario.edad = null;
    notifyListeners();
  }

  void agregarProfesion() {
    _usuario.profesiones!.add('Profesion ${_usuario.profesiones!.length + 1}');
    notifyListeners();
  }

}