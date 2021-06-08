import 'package:flutter/material.dart';
import 'Opening.dart';
import 'schemes.dart';
import 'logged_in_widget.dart';

class BottomTabbar extends StatefulWidget {
  const BottomTabbar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomTabbarState();
}

class _BottomTabbarState extends State<BottomTabbar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.agriculture), text: 'Farming Guide'),
    Tab(icon: Icon(Icons.article), text: 'Schemes'),
    Tab(icon: Icon(Icons.account_circle), text: 'Profile'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [Opening(), Schemes(), LoggedInWidget()],
      ),
      bottomNavigationBar: Material(
        color: Colors.green,
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
