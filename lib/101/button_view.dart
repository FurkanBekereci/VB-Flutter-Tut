import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        TextButton(
          onPressed: () {},
          style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.purple.shade300;
            }

            return Colors.amber;
          })),
          child: const Text('Denemeeee'),
        ),
        ElevatedButton(onPressed: () {}, child: const Text('Denemeeee')),
        IconButton(onPressed: () {}, icon: const Icon(Icons.access_time)),
        FloatingActionButton(onPressed: () {}, mini: true, child: const Icon(Icons.add)),
        OutlinedButton(
            style: OutlinedButton.styleFrom(backgroundColor: Colors.red, shape: const CircleBorder()),
            onPressed: () {},
            child: const Text('Denemeeee')),
        //Herhangi buton olmayan birşeye click event verilmesi için inkwell kullanılıyor. Örnek bir custom card component için verilebilir.
        InkWell(
          onTap: () {},
          child: const Text('Denemeeee'),
        ),
        Container(
          height: 200,
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * .2,
            // padding:
            //     const EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
            child: Text(
              'Place',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        )
      ]),
    );
  }
}


// Borders
// CircleBorder(), RoundedRectangleBorder()