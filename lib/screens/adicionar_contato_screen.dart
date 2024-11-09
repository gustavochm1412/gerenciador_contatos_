import 'package:flutter/material.dart';
import 'package:temperos_app/services/contatos_api.dart';

class AdicionarContatoScreen extends StatefulWidget {
  const AdicionarContatoScreen({super.key});

  @override
  _AdicionarContatoScreenState createState() => _AdicionarContatoScreenState();
}

class _AdicionarContatoScreenState extends State<AdicionarContatoScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _enderecoController = TextEditingController();
  final List<String> _tipos = [
    'Primo',
    'Amigo',
    'Colega',
    'Família',
    'Trabalho',
    'Cliente',
    'Fornecedor',
    'Parceiro',
    'Professor',
    'Vizinho',
    'Médico',
    'Outros'
  ];
  String? _tipoSelecionado;

  void _adicionarContato() async {
    if (_nomeController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _tipoSelecionado != null &&
        _enderecoController.text.isNotEmpty) {
      await _requisitionService
          .save(
        nome: _nomeController.text,
        email: _emailController.text,
        tipo: _tipoSelecionado!,
        endereco: _enderecoController.text,
      )
          .then((response) {
        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Contato adicionado com sucesso!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      });
      Navigator.pushNamed(context, '/listaContatos');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos')),
      );
    }
  }

  final RequisitionService _requisitionService = RequisitionService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Contato'),
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
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Tipo'),
              value: _tipoSelecionado,
              items: _tipos.map((String tipo) {
                return DropdownMenuItem<String>(
                  value: tipo,
                  child: Text(tipo),
                );
              }).toList(),
              onChanged: (String? novoValor) {
                setState(() {
                  _tipoSelecionado = novoValor;
                });
              },
            ),
            TextField(
              controller: _enderecoController,
              decoration: const InputDecoration(labelText: 'Endereço'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                _adicionarContato();
              },
              child: const Text('Adicionar Contato'),
            ),
          ],
        ),
      ),
    );
  }
}
