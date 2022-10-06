import 'package:flutter/material.dart';
import 'package:patrones/bloc/usuario/usuario_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patrones/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
        actions: [
          IconButton(
            onPressed: (){
              BlocProvider.of<UsuarioBloc>(context, listen: false).add(EliminarUsuario());
            }, 
            icon: const Icon(Icons.delete_outline)
          )
        ],
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (_, state) {
          if (state.existeUsuario) {
            return InformacionUsuario(usuario: state.usuario!);
          } else {
            return const Center(
              child: Text('No hay un usuario seleccionado'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({super.key, required this.usuario});
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
          ...usuario.profesiones!.map((prof) => ListTile(title: Text(prof))).toList()

        ],
      ),
    );
  }
}
