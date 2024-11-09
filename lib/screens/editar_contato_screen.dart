
import 'package:flutter/material.dart';

class EditarContatoScreen extends StatefulWidget {
  final Map<String, dynamic> contato;
  final Function(Map<String, dynamic>) onSave;

  const EditarContatoScreen({super.key, required this.contato, required this.onSave});

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
    _nomeController = TextEditingController(text: widget.contato['nome']);
    _tipoController = TextEditingController(text: widget.contato['Tipo']);
    _emailController = TextEditingController(text: widget.contato['E-mail']);
    _enderecoController = TextEditingController(text: widget.contato['Endereço']);
  }

  void _salvarContato() {
    widget.onSave({
      'nome': _nomeController.text,
      'Tipo': _tipoController.text,
      'E-mail': _emailController.text,
      'Endereço': _enderecoController.text,
    });
    Navigator.pop(context);
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
              decoration: const InputDecoration(labelText: 'Tipo (ex: Primo, Amigo)'),
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
              onPressed: _salvarContato,
              child: const Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
