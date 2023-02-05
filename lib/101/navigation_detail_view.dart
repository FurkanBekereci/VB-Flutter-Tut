import 'package:flutter/material.dart';

class NavigationDetailView extends StatefulWidget {
  const NavigationDetailView({Key? key}) : super(key: key);

  @override
  State<NavigationDetailView> createState() => _NavigationDetailViewState();
}

class _NavigationDetailViewState extends State<NavigationDetailView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton.icon(
          label: const Text('Onayla'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          icon: const Icon(Icons.check),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.back_hand_rounded),
        onPressed: () {},
      ),
    );
  }
}
