import 'package:flutter/material.dart';
import 'package:patrones/models/usuario.dart';
import 'package:patrones/services/usuario_service.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario  ? Text('Nombre: ${ usuarioService.usuario.nombre }'): Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final newUser = Usuario(
                  nombre: 'Josue ramirez', 
                  edad: 25,
                  profesiones: ['Desarrollador fullstack', 'Gamer']
                );
                usuarioService.usuario = newUser;
              },
              child: Text('Establecer Usuario',style: TextStyle(color: Colors.white)),
            ),
              MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar edad',style: TextStyle(color: Colors.white)),
              onPressed: () =>  usuarioService.cambiarEdad(26),
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Añadir Profesion',style: TextStyle(color: Colors.white)),
              onPressed: () => usuarioService.agregarProfesion(),
            )
          ],
        ),
      ),
    );
  }
}
