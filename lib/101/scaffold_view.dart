import 'package:flutter/material.dart';

class ScaffoldView extends StatelessWidget {
  const ScaffoldView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Not : Eğer ortak olduğunu düşündüğün app bar özellikleri varsa bunu main.dart içinde appbartheme property si altında ele almalısın.
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.amber, Colors.pink])),
        ),
        title: const Text('First App'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          const Center(
            child: CircularProgressIndicator(),
          )
        ],
        centerTitle: true,
        // Sol ikon
        leading: const Icon(Icons.chevron_left),
        // Ekran üstündeki mini widgetların(wifi, şarj yüzde, saat, alarm, ses modu gibi...) rengini ayarlıyor. (Light verilirse beyaz, dark verilirse siyah oluyor.)
        // systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.teal, Colors.yellow],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft)),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                          height: 200,
                        ))
              }),
      drawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined), label: 'First Item'),
        BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined), label: 'Second Item'),
      ]),
    );
  }
}
