import 'package:app/src/widgets/bottom_sheet_element.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          return Center(
            child: ElevatedButton(
              child: Text('Show Modal Bottom Sheet'),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return  Wrap(
                        children: [
                          bottom_sheet_element('Pedidos', Icons.shopping_cart),
                          bottom_sheet_element('Cobranzas', Icons.attach_money),
                          bottom_sheet_element('Creacion Clientes', Icons.person_add),
                          bottom_sheet_element('Devoluciones', Icons.currency_exchange),
                          bottom_sheet_element('Feedback', Icons.feedback),
                        ],
                      );
                    });
              },
            ),
          );
        }),
      ),
    );
  }
}
