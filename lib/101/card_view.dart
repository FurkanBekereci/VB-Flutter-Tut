import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: SizedBox(
              height: 100,
              width: 300,
            ),
          ),
          Card(
              color: Theme.of(context).colorScheme.error,
              child: const SizedBox(height: 100, width: 100)),
          const _CustomCard(child: SizedBox(
            height: 100,
            width: 300,
            ) 
          )
        ],
      ),
    );
  }
}

//Shape : Borders
//StadiumBorder(), CircleBorder(),RoundedRectangleBorder()

class _CustomCard extends StatelessWidget {

  const _CustomCard({Key? key, required this.child}) : super(key : key);

  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        child: child
      );
  }
}

/* Not : Eğer tüm kartlara ait olmasını istediğiniz bir özellik varsa bunu main.dart dosyasında theme
 * kısmında genelleştirme yaparak kullanabiliriz.
 */

