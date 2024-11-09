import 'package:flutter/material.dart';
import 'package:temperos_app/models/contato.dart';
import 'package:temperos_app/services/contatos_api.dart';

class EditarContatoScreen extends StatefulWidget {
  final Contato contato;
  final Function(Contato) onSave;

  const EditarContatoScreen(
      {super.key, required this.contato, required this.onSave});

  @override
  _EditarContatoScreenState createState() => _EditarContatoScreenState();
}

class _EditarContatoScreenState extends State<EditarContatoScreen> {
  late TextEditingController _nomeController;
  late TextEditingController _tipoController;
  late TextEditingController _emailController;
  late TextEditingController _enderecoController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController(text: widget.contato.nome);
    _tipoController = TextEditingController(
        text: widget.contato.tipos?.isNotEmpty == true
            ? widget.contato.tipos!.first.nome
            : '');
    _emailController = TextEditingController(text: widget.contato.email);
    _enderecoController = TextEditingController(text: widget.contato.endereco);
  }

  final RequisitionService _requisitionService = RequisitionService();

  void _atualizarContato() async {
    if (_nomeController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _tipoController.text.isNotEmpty &&
        _enderecoController.text.isNotEmpty) {
      await _requisitionService
          .update(
        id: widget.contato.id!,
        nome: _nomeController.text,
        email: _emailController.text,
        tipo: _tipoController.text,
        endereco: _enderecoController.text,
      )
          .then((response) {
        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Contato atualizado com sucesso!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      });
      Navigator.popAndPushNamed(context, '/listaContatos');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _tipoController,
              decoration:
                  const InputDecoration(labelText: 'Tipo (ex: Primo, Amigo)'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: _enderecoController,
              decoration: const InputDecoration(labelText: 'Endereço'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _atualizarContato(),
              child: const Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
