import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the box
  final _myBox = Hive.box('mybox');

  // write data
  void writeData() {
    _myBox.put(1, 'Max');
    _myBox.put(2, ['Sadie', 20, 'omega']);
  }

  // read data
  void readData() {
    print(_myBox.get(2));
    print(_myBox.get(1));
  }

  // delete data
  void deleteData() {
    print(_myBox.delete(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            onPressed: writeData,
            child: Text('Write'),
            color: Colors.green[200],
          ),
          MaterialButton(
            onPressed: readData,
            child: Text('Read'),
            color: Colors.blue[200],
          ),
          MaterialButton(
            onPressed: deleteData,
            child: Text('Delete'),
            color: Colors.red[200],
          )
        ],
      )),
    );
  }
}
