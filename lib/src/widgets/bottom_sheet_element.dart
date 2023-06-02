import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bottom_sheet_element extends StatelessWidget {
  IconData icon;
  String title;
  bottom_sheet_element(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 80,
        child: Center(
          child: ListTile(
            leading: Icon(icon,size: 35.0,color: Colors.black,),
            title: Text(
              title,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ),),
    );
  }
}
