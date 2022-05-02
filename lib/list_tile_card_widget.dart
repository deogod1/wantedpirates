import 'package:flutter/material.dart';

class ListTileCardWidget extends StatelessWidget {
  final String image;
  final Function()? onPressed;

  const ListTileCardWidget(
      {Key? key, required this.image, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
        onTap: onPressed);
  }
}
