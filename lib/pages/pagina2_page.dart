import 'package:flutter/material.dart';
import 'package:patrones/models/usuario.dart';
import 'package:patrones/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
            ? Text('Nombre: ${snapshot.data?.nombre}')
            : Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text('Establecer Usuario',style: TextStyle(color: Colors.white)),
              onPressed: () {
                final nuevoUsuario = new Usuario(nombre: 'Josue ramirez', edad: 25);
                usuarioService.cargarUsuario(nuevoUsuario);
              },
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar edad',style: TextStyle(color: Colors.white)),
              onPressed: () {
                usuarioService.cambiarEdad(26);
              },
            ),

            MaterialButton(
              color: Colors.blue,
              child: Text('Añadir Profesion',style: TextStyle(color: Colors.white)),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
