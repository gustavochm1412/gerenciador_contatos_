import 'package:flutter/material.dart';

class DetalhesContatoScreen extends StatelessWidget {
  const DetalhesContatoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Recuperando os argumentos passados pela navegação
    final contato =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(contato['nome']),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contato['nome'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Tipo: ${contato['tipos'][0]['nome']}',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 10),
            Text(
              'E-mail: ${contato['email']}',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            const SizedBox(height: 10),
            Text(
              'Endereço: ${contato['endereco']}',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
