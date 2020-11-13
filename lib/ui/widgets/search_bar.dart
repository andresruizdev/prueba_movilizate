import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Color color;
  final Icon prefixIcon;

  SearchBar(this.color, this.prefixIcon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: TextFormField(
          decoration: InputDecoration(
              fillColor: color,
              prefixIcon: prefixIcon,
              suffix: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {},
              )),
        ),
      ),
    );
  }
}
