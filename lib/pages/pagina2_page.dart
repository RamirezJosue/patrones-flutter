import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patrones/bloc/usuario/usuario_cubit.dart';
import 'package:patrones/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final newUser = Usuario(
                  nombre: 'Josue Ramirez',
                  edad: 25,
                  profesiones: [
                    'Desarrollador full stack',
                    'Gamer'
                  ]
                );
                usuarioCubit.seleccionarUsuario(newUser);
              },
              child: Text('Establecer Usuario',style: TextStyle(color: Colors.white)),
            ),
            
            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar edad',style: TextStyle(color: Colors.white)),
              onPressed: () {
                usuarioCubit.cambiarEdad(28);
              },
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Añadir Profesion',style: TextStyle(color: Colors.white)),
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
            )
          ],
        ),
      ),
    );
  }
}
