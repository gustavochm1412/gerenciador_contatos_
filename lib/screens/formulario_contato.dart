
import 'package:flutter/material.dart';

class FormularioContato extends StatefulWidget {
  const FormularioContato({super.key});

  @override
  _FormularioContatoState createState() => _FormularioContatoState();
}

class _FormularioContatoState extends State<FormularioContato> {
  final _nomeController = TextEditingController();
  final _tipoController = TextEditingController();
  final _emailController = TextEditingController();
  final _enderecoController = TextEditingController();

  void _salvarContato() {
    final nome = _nomeController.text;
    final tipo = _tipoController.text;
    final email = _emailController.text;
    final endereco = _enderecoController.text;

    if (nome.isNotEmpty && tipo.isNotEmpty && email.isNotEmpty && endereco.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contato cadastrado com sucesso!')),
      );
      _nomeController.clear();
      _tipoController.clear();
      _emailController.clear();
      _enderecoController.clear();
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
        title: const Text('Formulário de Contato'),
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
              child: const Text('Salvar Contato'),
            ),
          ],
        ),
      ),
    );
  }
}
