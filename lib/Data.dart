import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Data extends StatefulWidget {
  final String filename;
  Data({Key key, this.filename}) : super(key: key);
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  String data = '';
  String item, grow, fer;
  fetchdata() async {
    String r =
        await rootBundle.loadString('txtfiles/' + widget.filename + 'd.txt');
    String s =
        await rootBundle.loadString('txtfiles/' + widget.filename + 'c.txt');
    String f =
        await rootBundle.loadString('txtfiles/' + widget.filename + 'f.txt');

    setState(() {
      item = widget.filename;
      data = r;
      grow = s;
      fer = f;
    });
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _kTabs = <Tab>[
      const Tab(icon: Icon(Icons.info), text: 'About'),
      const Tab(icon: Icon(Icons.grass), text: 'How to Grow'),
      const Tab(icon: Icon(Icons.filter_alt), text: 'Fertilizers'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: Text(
            item,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(tabs: _kTabs),
        ),
        body: TabBarView(children: [
          Container(
            width: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      data,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      grow,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      fer,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
