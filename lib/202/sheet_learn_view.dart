import 'package:first_project/core/random_image.dart';
import 'package:flutter/material.dart';

class SheetLearnView extends StatefulWidget {
  const SheetLearnView({Key? key}) : super(key: key);

  @override
  State<SheetLearnView> createState() => _SheetLearnViewState();
}

class _SheetLearnViewState extends State<SheetLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.red,
            // barrierColor: Colors.transparent, //Arka plan rengi
            enableDrag: true,
            elevation: 20,
            isDismissible: true,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            builder: (context) {
              return _CustomBottomSheet(
                onPressed: () {},
              );
            },
          );
        },
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}

class _CustomBottomSheet extends StatelessWidget {
  _CustomBottomSheet({Key? key, this.onPressed}) : super(key: key);
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 32,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        color: Colors.red,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    Divider(
                      color: Colors.black26,
                      thickness: 3,
                      indent: MediaQuery.of(context).size.width * 0.45,
                      endIndent: MediaQuery.of(context).size.width * 0.45,
                    ),
                  ],
                ),
              ),
              const Text('data'),
              const RandomImage(height: 200),
              ElevatedButton(
                onPressed: onPressed,
                child: const Text('OK'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
