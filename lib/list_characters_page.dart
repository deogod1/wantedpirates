import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wantedpirates/character.dart';
import 'package:wantedpirates/enum_class_types.dart';
import 'package:wantedpirates/video_player.dart';

class ListCharactersPage extends StatefulWidget {
  final Classes type;

  const ListCharactersPage({Key? key, required this.type}) : super(key: key);

  @override
  State<ListCharactersPage> createState() => _ListCharactersPageState();
}

class _ListCharactersPageState extends State<ListCharactersPage> {
  late List<Character> charactersList;

  @override
  void initState() {
    charactersList = [];
    _loadCharacters();
    super.initState();
  }

  Future<void> _loadCharacters() async {
    final fileString = await rootBundle
        .loadString('assets/characters/${widget.type.name}.json');
    final charactersListMap = jsonDecode(fileString);
    final characters = Character.listFromSource(charactersListMap);
    setState(() {
      charactersList = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
          children: charactersList
              .map((e) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.network(e.image),
                      ),
                      Text(e.name),
                      Text("Recomendados: "),
                      Wrap(
                        children: e.recomend
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, bottom: 8.0, top: 8.0),
                                  child: Text(e),
                                ))
                            .toList(),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (e.link.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        videoPlayer(link: e.link)));
                          } else {
                            showAlertDialog(context);
                          }
                        },
                        child: Text("Exemplo"),
                      )
                    ],
                  ))
              .toList()),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Problema"),
      content: Text("Video ainda não inserido!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
