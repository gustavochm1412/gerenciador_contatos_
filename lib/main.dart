import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/login_screen.dart';
import 'screens/adicionar_contato_screen.dart';
import 'screens/lista_contatos_screen.dart';
import 'screens/detalhes_contato_screen.dart';
import 'screens/editar_contato_screen.dart';

void main() {
  runApp(const ContatosApp());
}

class ContatosApp extends StatelessWidget {
  const ContatosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Contatos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/login': (context) => const LoginScreen(),
        '/listaContatos': (context) => const ListaContatosScreen(),
        '/adicionarContato': (context) => const AdicionarContatoScreen(),
        '/detalhesContato': (context) =>
            const DetalhesContatoScreen(contato: {}),
        '/editarContato': (context) =>
            EditarContatoScreen(contato: {}, onSave: (contato) {}),
      },
    );
  }
}
