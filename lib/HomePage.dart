import 'package:flutter/material.dart';
import 'package:wantedpirates/enum_class_types.dart';
import 'package:wantedpirates/list_characters_page.dart';
import 'package:wantedpirates/list_tile_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children: Classes.values
              .map((e) => ListTileCardWidget(
                  image: classMapImages[e] ?? "",
                  onPressed: () => onClassTypePressed(e)))
              .toList()),
    );
  }

  void onClassTypePressed(Classes type) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ListCharactersPage(
              type: type,
            )));
  }
}
