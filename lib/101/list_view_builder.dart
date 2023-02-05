import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(color: Colors.red);
        },
        cacheExtent: 20,
        itemCount: 200,
        itemBuilder: (context, index) {
          // print('Helloo');
          return const MyWidget();
        },
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    // print("initialized");
    super.initState();
  }

  @override
  void dispose() {
    // print("disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Column(children: [Expanded(child: Image.network('https://picsum.photos/200')), const Text('a')]));
  }
}
