import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';

class Schemedata extends StatefulWidget {
  final filenum;
  final String sname;
  Schemedata({Key key, this.filenum, this.sname}) : super(key: key);
  @override
  _SchemedataState createState() => _SchemedataState();
}

class _SchemedataState extends State<Schemedata> {
  String data = '';
  String item, url;
  List l = [];
  List l1 = [];
  List l2 = [
    'https://pmkisan.gov.in/',
    'https://maandhan.in/',
    'https://www.india.gov.in/spotlight/pradhan-mantri-annadata-aay-sanrakshan-abhiyan-pm-aasha',
    'https://nahep.icar.gov.in/',
    'https://dmi.gov.in/Schemeisam.aspx',
    'https://pmfby.gov.in/',
    'https://www.soilhealth.dac.gov.in/',
    'https://pmksy.gov.in/',
    'https://sbi.co.in/web/agri-rural/agriculture-banking/crop-loan/kisan-credit-card',
    'https://vikaspedia.in/agriculture/agri-insurance/unified-package-insurance-scheme',
    'https://icar.org.in/content/krishi-vigyan-kendra',
    'https://agricoop.gov.in',
    'https://pdduuksy.icar.gov.in/',
    'https://dfr.icar.gov.in/Extension/ARYA',
    'https://ysrrythubharosa.ap.gov.in/',
    'https://www.indiafilings.com/learn/dairy-entrepreneurship-development-scheme/',
    'https://www.indiafilings.com/learn/dairy-entrepreneurship-development-scheme/',
    'https://midh.gov.in/',
    'https://nmoop.gov.in/',
    'https://agriculturemizoram.nic.in',
    'https://nmsa.dac.gov.in/',
    'https://www.enam.gov.in/',
    'https://dmi.gov.in'
  ];
  var a;
  fetchdata() async {
    String r = await rootBundle.loadString('txtfiles/ELIGIBILITY.txt');
    String r1 = await rootBundle.loadString('txtfiles/schemedescription.txt');

    setState(() {
      item = widget.sname;
      a = widget.filenum;
      data = r;
      l = r.split("@");
      l1 = r1.split("@");
      url = l2[a];
    });
  }

  _launchURL() async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text(
          item,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: _launchURL,
        icon: Icon(Icons.link),
        label: Text('Website'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Text(
            l1[a],
            style: TextStyle(fontSize: 20.0),
          ),
          Text(
            l[a],
            style: TextStyle(fontSize: 20.0),
          ),
        ]),
      ),
    );
  }
}
