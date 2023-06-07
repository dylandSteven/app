import 'package:app/src/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCardView extends StatefulWidget {
  final Product product;
  final Alignment imageAlignment;
  final Function(String)? onTap;

  ProductCardView(this.product,
      {Key? key, this.imageAlignment = Alignment.bottomCenter, this.onTap})
      : super(key: key);

  _ProductCardView createState() =>
      _ProductCardView(this.product, this.imageAlignment);
}

class _ProductCardView extends State<ProductCardView> {
  final Product product;
  final Alignment imageAlignment;

  _ProductCardView(this.product, this.imageAlignment);

  @override
  Widget build(BuildContext context) {
    // final priceValue = (product.price?.onSales ?? false)
    //     ? product.price?.discountedValue
    //     : product.price?.value;
    final crossedValue = 50;

    // final crossedValue =(product.price?.onSales ?? false) ? product.price?.value : null;
    int _count = 0;
    final myController = TextEditingController();
    return FittedBox(
      child: Card(
        child: Column(children: [
          SizedBox(
              height: 30,
              child: Center(
                child: Text('Sku ${product.skuCode}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: Theme.of(context).textTheme.caption),
              )),
          Stack(alignment: AlignmentDirectional.bottomStart, children: [
            Center(
              child: SizedBox(
                height: 130,
                // width: MediaQuery.of(context).size.width,
                child: Image.network(product.image.toString(),
                    alignment: imageAlignment, fit: BoxFit.contain),
              ),
            ),
          ]),
          Center(child: const SizedBox(height: 8)),
          Center(
            child: SizedBox(
                child: Text(product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(color: Colors.blue[400]))),
          ),
          Center(
            child: SizedBox(
                child: Text('Stock: ${product.stock}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: TextStyle(color: Colors.black54))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${this.product.price}S/.',
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  softWrap: false,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.green)),
              if (crossedValue != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('$crossedValue S./',
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.copyWith(decoration: TextDecoration.lineThrough)),
                ),
            ],
          ),
          SizedBox(
            height: 30,
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: IconButton(
                    iconSize: 15,
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        _count -= 1;
                        myController.text = _count.toString();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0,left: 4.0),
                  child: SizedBox(
                    height: 18,
                    width: 35,
                    child: TextField(
                      controller: myController,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 15, 119, 199)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 15,
                    onPressed: () {
                      setState(() {
                        _count += 1;
                        myController.text = _count.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
