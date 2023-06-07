import 'package:app/src/menu.dart';
import 'package:app/src/model/product_model.dart';
import 'package:app/src/service/product_service.dart';
import 'package:app/src/widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

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
          listTileTheme: const ListTileThemeData(
            textColor: Colors.white,
          ),
          useMaterial3: true,
        ),
        home: LisTileExample());
  }
}

class LisTileExample extends StatefulWidget {
  const LisTileExample({super.key});

  @override
  State<LisTileExample> createState() => _LisTileExampleState();
}

class _LisTileExampleState extends State<LisTileExample>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _sizeController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _sizeAnimation;

  late Future<List<Product>> products = fetchProduct();
  final List<Widget> list = [];

  @override
  void initState() {
    // products.then((value) => {
    //       value.forEach((element) {
    //         print(element);
    //         print(element.name);
    //         setState(() {
    //           list.add(ProductCardView(Product(
    //               id: element.id,
    //               skuCode: element.skuCode,
    //               name: element.name,
    //               stock: element.stock,
    //               price: element.price,
    //               image: element.image)));
    //         });
    //       })
    //     });

    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _sizeController = AnimationController(
      duration: const Duration(milliseconds: 850),
      vsync: this,
    )..repeat(reverse: true);

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _sizeAnimation = CurvedAnimation(
      parent: _sizeController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list2 = [];
    String searchValue = '';

    list2.add(ProductCardView(Product(
        id: 1,
        skuCode: "skuCode",
        name: "Desodorante",
        stock: "stock",
        price: 10.00,
        image:
            "https://e7.pngegg.com/pngimages/926/883/png-clipart-deodorant-deodorant.png")));
    list2.add(ProductCardView(Product(
        id: 2,
        skuCode: "skuCode",
        name: "Desodorante",
        stock: "stock",
        price: 10.00,
        image:
            "https://e7.pngegg.com/pngimages/926/883/png-clipart-deodorant-deodorant.png")));
    list2.add(ProductCardView(Product(
        id: 3,
        skuCode: "skuCode",
        name: "Jame",
        stock: "stock",
        price: 10.00,
        image:
            "https://e7.pngegg.com/pngimages/926/883/png-clipart-deodorant-deodorant.png")));
    list2.add(ProductCardView(Product(
        id: 4,
        skuCode: "skuCode",
        name: "Desodorante",
        stock: "stock",
        price: 10.00,
        image:
            "https://e7.pngegg.com/pngimages/926/883/png-clipart-deodorant-deodorant.png")));
    list2.add(ProductCardView(Product(
        id: 5,
        skuCode: "skuCode",
        name: "Jame",
        stock: "stock",
        price: 10.00,
        image:
            "https://e7.pngegg.com/pngimages/926/883/png-clipart-deodorant-deodorant.png")));
    list2.add(ProductCardView(Product(
        id: 6,
        skuCode: "skuCode",
        name: "Desodorante",
        stock: "stock",
        price: 10.00,
        image:
            "https://e7.pngegg.com/pngimages/926/883/png-clipart-deodorant-deodorant.png")));
    list2.add(ProductCardView(Product(
        id: 7,
        skuCode: "skuCode",
        name: "Jame",
        stock: "stock",
        price: 10.00,
        image:
            "https://e7.pngegg.com/pngimages/926/883/png-clipart-deodorant-deodorant.png")));
    list2.add(ProductCardView(Product(
        id: 8,
        skuCode: "skuCode",
        name: "Jame",
        stock: "stock",
        price: 10.00,
        image:
            "https://e7.pngegg.com/pngimages/926/883/png-clipart-deodorant-deodorant.png")));
    list2.add(ProductCardView(Product(
        id: 9,
        skuCode: "skuCode",
        name: "Jame",
        stock: "stock",
        price: 10.00,
        image:
            "https://e7.pngegg.com/pngimages/926/883/png-clipart-deodorant-deodorant.png")));
    list2.add(ProductCardView(Product(
        id: 10,
        skuCode: "skuCode",
        name: "Jame",
        stock: "stock",
        price: 10.00,
        image:
            "https://e7.pngegg.com/pngimages/926/883/png-clipart-deodorant-deodorant.png")));

    return Scaffold(
      appBar: AppBar(title: const Text('ListTile Samples')),
      body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (1 / 2),
          children: list2),
    );
  }
}
