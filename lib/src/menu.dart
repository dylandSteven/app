import 'package:app/src/widgets/bottom_sheet_element.dart';
import 'package:flutter/material.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Modal Bottom Sheet Demo',
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('Creating a Modal Bottom Sheet'),
        ),
        body: Builder(builder: (context) {
          return GestureDetector(onVerticalDragEnd: (DragEndDetails details) {
            if (details.primaryVelocity! < 0) {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: [
                        bottom_sheet_element('Pedidos', Icons.shopping_cart),
                        bottom_sheet_element('Cobranzas', Icons.attach_money),
                        bottom_sheet_element(
                            'Devoluciones', Icons.currency_exchange),
                        bottom_sheet_element('Feedback', Icons.feedback),
                      ],
                    );
                  });
            }
          });
        }),
      ),
    );
  }
}
