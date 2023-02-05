import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _tabController.animateTo(1);
            },
            child: const Icon(Icons.access_alarms_outlined),
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: 10,
            shape: const CircularNotchedRectangle(),
            child: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.yellowAccent,
              controller: _tabController,
              tabs: const [
                Tab(text: 'Page1'),
                Tab(text: 'Page2'),
              ],
            ),
          ),
          appBar: AppBar(),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              Container(color: Colors.red),
              Container(color: Colors.green),
            ],
          ),
        ));
  }
}
