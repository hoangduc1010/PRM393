import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prm_project/UI/Widgets/BodyWidget.dart';


class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Home page'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Bodywidget(),
    );
    throw UnimplementedError();
  }
}
