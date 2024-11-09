import 'package:flutter/material.dart';
import 'package:temperos_app/models/contato.dart';
import 'package:temperos_app/screens/editar_contato_screen.dart';
import 'package:temperos_app/services/contatos_api.dart';
import 'adicionar_contato_screen.dart';

class ListaContatosScreen extends StatefulWidget {
  const ListaContatosScreen({super.key});

  @override
  _ListaContatosScreenState createState() => _ListaContatosScreenState();
}

class _ListaContatosScreenState extends State<ListaContatosScreen> {
  List<Contato> contatos = [];

  @override
  void initState() {
    super.initState();
    fetch();
  }

  final RequisitionService _requisitionService = RequisitionService();

  fetch() async {
    try {
      final contatosObtidos = await _requisitionService.findTodo();
      setState(() {
        contatos = contatosObtidos;
      });
    } catch (e) {
      print('Erro ao buscar contatos: $e');
      setState(() {
        contatos = [];
      });
    }
  }

  void _abrirDetalhes(Contato contato, int index) {
    Navigator.pushNamed(
      context,
      '/detalhesContato',
      arguments: contatos[index].toJson(),
    );
  }

  void _editarContato(Contato contato, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditarContatoScreen(
          contato: contato,
          onSave: (contatoAtualizado) {
            setState(() {
              contatos[index] = contatoAtualizado;
            });
          },
        ),
      ),
    );
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
              ).then((value) {
                if (value != null && value is Contato) {
                  setState(() {
                    contatos.add(value);
                  });
                }
              });
            },
          ),
        ],
      ),
      body: contatos.isEmpty
          ? const Center(
              child: Text('Nenhum contato'),
            )
          : ListView.builder(
              itemCount: contatos.length,
              itemBuilder: (context, index) {
                final contatoAtual = contatos[index];
                return ListTile(
                  title: Text(contatoAtual.nome ?? 'Nome não disponível'),
                  subtitle: Text(
                    contatoAtual.tipos != null && contatoAtual.tipos!.isNotEmpty
                        ? contatoAtual.tipos!
                            .map((tipo) => tipo.nome)
                            .join(', ')
                        : 'Nenhum tipo disponível',
                  ),
                  onTap: () => _abrirDetalhes(contatoAtual, index),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editarContato(contatoAtual, index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await _requisitionService.delete(
                              id: contatoAtual.id!);
                          setState(() {
                            contatos.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
