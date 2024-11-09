import 'package:flutter/material.dart';
import 'detalhes_contato_screen.dart';
import 'editar_contato_screen.dart';
import 'adicionar_contato_screen.dart';

class ListaContatosScreen extends StatefulWidget {
  const ListaContatosScreen({super.key});

  @override
  _ListaContatosScreenState createState() => _ListaContatosScreenState();
}

class _ListaContatosScreenState extends State<ListaContatosScreen> {
  List<Map<String, dynamic>> contatos = [
    {
      'nome': 'Gustavo Mesquita',
      'Tipo': 'Primo',
      'E-mail': 'Gustavoteste@gmail.com',
      'Endereço': 'Rua HELLO WORD, 123',
    },
    {
      'nome': 'Lucas Calixto',
      'Tipo': 'Amigo',
      'E-mail': 'Lucasteste@gmail.com',
      'Endereço': 'Rua WORD, 123',
    },
    {
      'nome': 'Vitor Eije',
      'Tipo': 'Amigo',
      'E-mail': 'Vitorteste@gmail.com',
      'Endereço': 'Rua HELLO, 123',
    },
  ];

  void _abrirDetalhes(Map<String, dynamic> contato) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesContatoScreen(contato: contato),
      ),
    );
  }

  void _editarContato(Map<String, dynamic> contato) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditarContatoScreen(
          contato: contato,
          onSave: (contatoAtualizado) {
            setState(() {
              final index = contatos.indexOf(contato);
              if (index != -1) {
                contatos[index] = contatoAtualizado;
              }
            });
          },
        ),
      ),
    );
  }

  void _excluirContato(Map<String, dynamic> contato) {
    setState(() {
      contatos.remove(contato);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdicionarContatoScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          final contato = contatos[index];
          return ListTile(
            title: Text(contato['nome']),
            subtitle: Text(contato['Tipo']),
            onTap: () => _abrirDetalhes(contato),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _editarContato(contato),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _excluirContato(contato),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
