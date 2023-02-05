import 'package:first_project/202/package/loading_bar.dart';
import 'package:flutter/material.dart';

import 'launch_manager_mixin.dart';

//Genel mantık adapter pattern kullan. Dışardan aldığın sistemine doğrundan değil dolaylı olarak konumlandır.
class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with LaunchManagerMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: LoadingBar(size: 40),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.secondary,
        onPressed: () {
          goToExternalUrl('https://www.google.com.tr');
        },
      ),
    );
  }
}
