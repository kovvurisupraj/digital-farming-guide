import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Data.dart';
import 'authentification.dart';

class Opening extends StatelessWidget {
  Future<void> signOut() async {
    await Authentification().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 570.0,
                  floating: false,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        "Digital Farming Guide",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      background: Image.asset(
                        "images/veggies.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(_buildList(7, context)),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: signOut,
              child: const Icon(Icons.logout),
              backgroundColor: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

List _buildList(int count, context) {
  List<Widget> listItems = [];
  List x = ['Rice', 'Wheat', 'Corn', 'Potato', 'Tomato', 'Tea', 'Groundnuts'];
  for (int i = 0; i < count; i++) {
    listItems.add(
      Padding(
        padding: EdgeInsets.all(16.0),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Data(filename: x[i])),
            );
          },
          child: Card(
            child: Column(
              children: [
                Image.asset(
                  'images/' + x[i] + '.jpg',
                  fit: BoxFit.cover,
                ),
                Text(
                  x[i],
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
              ],
            ),
            color: Colors.black54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            margin: EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
  return listItems;
}
