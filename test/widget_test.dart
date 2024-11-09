import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';

void main() {
  group('Gerenciador de Contatos - Testes de Widget', () {
    testWidgets('Verificar se a tela inicial exibe o título corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.text('Gerenciador de Contatos'), findsOneWidget);
    });

    testWidgets(
        'Verificar se o botão de adicionar contato está presente e funciona',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      expect(find.byType(TextFormField), findsWidgets);
    });

    testWidgets('Verificar se a lista de contatos é exibida corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('Verificar se um contato pode ser removido',
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).first, 'Contato Teste');
      await tester.tap(find.text('Salvar'));
      await tester.pumpAndSettle();

      expect(find.text('Contato Teste'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete).first);
      await tester.pumpAndSettle();

      expect(find.text('Contato Teste'), findsNothing);
    });
  });
}
