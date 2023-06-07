import 'package:flutter/material.dart';

class heroItem extends StatelessWidget {
  String tag;
  heroItem(this.tag);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: this.tag,
        // Wrap the ListTile in a Material widget so the ListTile has someplace
        // to draw the animated colors during the hero transition.
        child: Material(
          child: ListTile(
            title: const Text('ListTile with Hero'),
            subtitle: const Text('Tap here for Hero transition'),
            tileColor: Colors.cyan,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(title: const Text('ListTile Hero')),
                    body: Center(
                      child: Hero(
                        tag: this.tag,
                        child: Material(
                          child: ListTile(
                            title: const Text('ListTile with Hero'),
                            subtitle: const Text('Tap here to go back'),
                            tileColor: Colors.blue[700],
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
