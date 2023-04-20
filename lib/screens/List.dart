import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedList extends StatefulWidget {
  const SharedList({Key? key}) : super(key: key);

  @override
  State<SharedList> createState() => SharedListState();
}

class SharedListState extends State<SharedList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 20,
        color: Colors.orangeAccent,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(height: 8),
              const Text("soy una lista"),
              TextButton(
                onPressed: () {},
                child: const Text('Open List'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
