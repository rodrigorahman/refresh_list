import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> lista;
  var random = new Random();

  @override
  void initState() {
    lista = _generateList();
    super.initState();
  }

  _generateList() => List.generate(random.nextInt(10), (i) => 'Item $i');

  Future<void> _reloadList() async {
    var newList =
        await Future.delayed(Duration(seconds: 2), () => _generateList());
    
    setState(() {
      lista = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Refresh')),
      body: RefreshIndicator(
        onRefresh: _reloadList,
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (_, int index) {
            return ListTile(
              title: Text(lista[index]),
            );
          },
        ),
      ),
    );
  }
}
