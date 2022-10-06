import 'package:flutter/material.dart';
import 'package:patrones/models/usuario.dart';
import 'package:patrones/services/usuario_service.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
        actions: [
          IconButton(
            onPressed: () =>  usuarioService.removerUsuario(), 
            icon: Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: usuarioService.existeUsuario ? 
       InformacionUsuario( usuarioService.usuario ): Center(child: Text('No hay usuario seleccionado'),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario(this.usuario);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('General',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text('Profesiones',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          // ListTile(title: Text('Profesion 1: ')),
          ...usuario.profesiones!.map(
            (profesion) => ListTile(title: Text(profesion))
          ).toList()
        ],
      ),
    );
  }
}
