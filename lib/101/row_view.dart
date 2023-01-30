import 'package:flutter/material.dart';

class RowView extends StatelessWidget {
  const RowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                      flex: MediaQuery.of(context).size.width > 700 ? 1 : 2,
                      child: Container(color: Colors.red)),
                  Expanded(child: Container(color: Colors.amber)),
                  Expanded(child: Container(color: Colors.blue)),
                  Expanded(child: Container(color: Colors.teal)),
                ],
              )),
          // Expanded(flex:2, child: Container(color: Colors.green)),
          const Spacer(flex: 2),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment etkisiz hale gelir. Min olursa childlar birbirine yanaşır. Max olursa birbirinden uzaklaşır.
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('1'),
                  Text('2'),
                  Text('3'),
                ],
              )),
          SizedBox(
            height: ProjectContainerSizes.cardHeight,
            child: Column(
              children: const [
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
                Expanded(child: Text('data')),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProjectContainerSizes {
  static const double cardHeight = 200;
}
/** Notlar : 
 * "Expanded" sarmalı kullanılarak ekranın orantılı şekilde 
 * ayrılması sağlanıyor.
 * "flex" kullanımı ile istenen oranda bölünme sağlanabilir. 
 * Spacer kullanılarak boş alan oluşturulabilir. 
 * mainAxisSize: child elementlerin birbirine yakın ya da uzak olması sağlanır, default = max
 * mainAxisAlignment : Row ise vertical alignment, Column ise horizontal alignment
 * crossAxisAlignment : Row ise horizontal alignment, Column ise vertical alignment
 * yani hangi doğrultuda bir component ise o doğrultuda bir ayrışma var.
*/