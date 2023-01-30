import 'package:first_project/core/random_image.dart';
import 'package:flutter/material.dart';

class ListTileView extends StatelessWidget {
  const ListTileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: const RandomImage(),
                    subtitle: const Text('What do you do with your card?'),
                    leading: Container(
                        height: 200,
                        width: 30,
                        alignment: Alignment.topCenter,
                        color: Colors.red,
                        child: const Icon(Icons.money)),
                    trailing: const SizedBox(
                        width: 20, child: Icon(Icons.chevron_right)),
                    onTap: () {},
                    minVerticalPadding: 0,
                    dense: true,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
