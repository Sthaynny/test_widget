import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_widget/app/my_home_screen.dart';

// Função auxiliar para envolver os widgets a serem testados.
Widget makeTestable(Widget widget) => MaterialApp(home: widget);
void main() {
  testWidgets('testa se a tela esta sendo instanciada',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestable(MyHomeScreen()));
    final Finder scaffoldFiner = find.byType(Scaffold);
    expect(scaffoldFiner, findsOneWidget);
  });

  testWidgets(
    'Validação do Completa',
    (WidgetTester tester) async {
      // pumpWidget() renderiza a UI dado um widget.
      await tester.pumpWidget(makeTestable(MyHomeScreen()));

      // Finder utilizado para garantir que um elemento do tipo Icon foi renderizado.
      final Finder iconFinder = find.byType(Icon);

      // Aqui utilizamos nosso Finder junto ao nosso Matcher para garantirmos que temos apenas um Icon sendo renderizado.
      expect(iconFinder, findsOneWidget);

      /**
       * É necessario o Widget para fazer validações mais a fundo.
       * O tester.widget busca o compenente para que possar ser feita algumas 
       * validações necessarias.
       */
      final Icon icon = tester.widget(iconFinder);
      expect(icon.color, Colors.pink[200]);
      expect(icon.size, 42);
      expect(icon.icon, Icons.favorite_border);

      final buttonFinder = find.byType(CupertinoButton);

      expect(buttonFinder, findsOneWidget);

      await tester.longPress(buttonFinder);
      await tester.pumpAndSettle();

      final Icon iconAfter = tester.widget(iconFinder);
      expect(iconAfter.color, Colors.pink);
      expect(iconAfter.size, 88);
      expect(iconAfter.icon, Icons.favorite);
    },
  );
}
