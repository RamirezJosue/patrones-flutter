import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patrones/bloc/usuario/usuario_cubit.dart';
import 'package:patrones/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<UsuarioCubit>().borrarUsuario();
            }, 
            icon: Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(child: Text('No hay informarción del usuario'));
          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).usuario);
          default:
            return Center(child: Text('Estado no reconocido'));
        }

        // if (state is UsuarioInitial) {
        //   return Center(child: Text('No hay informarción del usuario'));
        // } else if( state is UsuarioActivo) {
        //   return InformacionUsuario(state.usuario);
        // }
        // return Center(child: Text('Estado no reconocido'));
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario( this.usuario );
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
          ...usuario.profesiones!.map((profesion) => ListTile(title: Text(profesion))).toList()
        ],
      ),
    );
  }
}
