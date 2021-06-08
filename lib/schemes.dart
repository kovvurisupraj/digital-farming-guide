import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'schemeinfo.dart';

class Schemes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Schemes"),
          elevation: 1.0,
          backgroundColor: Colors.green,
        ),
        body: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildListDelegate(sample(23, context)),
          ),
        ]),
      ),
    );
  }
}

List sample(int count, context) {
  List<Widget> listItems = [];
  List x = [
    "PM Kisan Samman Nidhi (PM-Kisan)",
    "PM Kisan Maandhan Yojana (PMKMY)",
    "Pradhan Mantri Annadata AAY Sanrakshan Abhiyan (PMAASHA)",
    "National Agricultural Higher Educational Project (NAHEP)",
    "Integrated Scheme for Agricultural Marketing",
    "PM Fasal Bima Yojana(PMFBY)",
    "Soil Health Card Scheme (SHC)",
    "Pradhan Mantri Krishi Sinchayee Yojana (PMKSY)",
    "Kisan Credit Card (KCC)",
    "Unified Package Insurance Scheme",
    "Krishi Vigyan Kendras",
    "Strengthening & Modernization of Pest Management Approach in The Country(SMPMA)",
    "Pandit DeenDayal Upadhyay UnnatKrishi Shiksha Yojana",
    "Attracting and Retaining Youth in Agriculture (ARYA) Project",
    "AP YSR Rythu Bharosa",
    "National Dairy Plan-I",
    "Dairy Entrepreneurship Development Scheme (DEDS)",
    "Mission for Integrated Development of Horticulture(MIDH)",
    "National Mission on Oilseeds and Oil Palm",
    "Paramparagat Krishi Vikas Yojana",
    "National Mission on Sustainable Agriculture(NMSA)",
    "National Agricultural Market (NAM)",
    "Gramin Retail Agriculture Markets (GrAMs)"
  ];
  for (int i = 0; i < count; i++) {
    listItems.add(
      Padding(
        padding: EdgeInsets.all(1.0),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Schemedata(filenum: i, sname: x[i])),
            );
          },
          child: Card(
              child: ListTile(
                  title: Text(
            x[i],
            style: TextStyle(fontSize: 18.0),
          )) /*SizedBox(
              width: 500.0,
              height: 80.0,
              child: Center(
                child: Text(
                  x[i],
                  style: TextStyle(fontSize: 22.0, color: Colors.white),
                ),
              ),
            ),
            color: Colors.black54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.all(10),*/
              ),
        ),
      ),
    );
  }
  return listItems;
}
