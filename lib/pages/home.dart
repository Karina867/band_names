import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:band_names/models/band.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Queen', votes: 1),
    Band(id: '3', name: 'Heroes del silencio', votes: 2),
    Band(id: '4', name: 'Bon Jovi', votes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BandNames',
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) => _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: addNewBand,
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id ?? ''),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('direction: $direction');
        // TODO: llamar el llamado en el server
      },
      background: Container(
        padding: EdgeInsets.only(
          left: 8.0,
        ),
        color: Colors.red,
        child: Align(
          child: Text(
            'Delete Band ',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          alignment: Alignment.centerLeft,
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name!.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name!),
        trailing: Text(
          '${band.votes}',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  addNewBand() {
    final textComtroller = new TextEditingController();

    // if (Platform.isAndroid) {
    //   showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           title: Text('New Band Name: '),
    //           content: TextField(
    //             controller: textComtroller,
    //           ),
    //           actions: <Widget>[
    //             MaterialButton(
    //               child: Text('Add'),
    //               elevation: 5,
    //               textColor: Colors.blue,
    //               onPressed: () => addBandToList(textComtroller.text),
    //             ),
    //           ],
    //         );
    //       });
    // }

    showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text('New Band Name'),
            content: CupertinoTextField(
              controller: textComtroller,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('Add'),
                isDefaultAction: true,
                onPressed: () => addBandToList(textComtroller.text),
              ),
              CupertinoDialogAction(
                child: Text('Dismiss'),
                isDestructiveAction: true,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  addBandToList(String name) {
    if (name.length > 1) {
      this.bands.add(
            new Band(
              id: DateTime.now().toString(),
              name: name,
              votes: 0,
            ),
          );
      setState(() {});
    }

    Navigator.pop(context);
  }
}
