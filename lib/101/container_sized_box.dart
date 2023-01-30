import 'package:flutter/material.dart';

class ContainerSizedBoxView extends StatelessWidget {
  const ContainerSizedBoxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(width: 300, height: 200, child: Text(('as' * 300))),
          const SizedBox.shrink(),
          SizedBox.square(dimension: 50, child: Text('b' * 50)),
          Container(
            width: 50,
            height: 50,
            //color: Colors.red,
            constraints: const BoxConstraints(
                minWidth: 100, maxWidth: 150, maxHeight: 100),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
            child: Text('aa' * 100),
          )
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      //color: Colors.red,
      // shape: BoxShape.circle,
      gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
      boxShadow: const [
        BoxShadow(color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
      ],
      border: Border.all(width: 10, color: Colors.white12));
}

class ProjectContainerDecoration extends BoxDecoration {
  ProjectContainerDecoration()
      : super(
            borderRadius: BorderRadius.circular(10),
            //color: Colors.red,
            // shape: BoxShape.circle,
            gradient: const LinearGradient(colors: [Colors.red, Colors.black]),
            boxShadow: const [
              BoxShadow(
                  color: Colors.green, offset: Offset(0.1, 1), blurRadius: 12)
            ],
            border: Border.all(width: 10, color: Colors.white12));
}
