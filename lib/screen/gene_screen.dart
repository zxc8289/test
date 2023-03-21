import 'package:balanstate_test02/const/const.dart';
import 'package:flutter/material.dart';

class GeneScreen extends StatefulWidget {
  const GeneScreen({Key? key}) : super(key: key);

  @override
  State<GeneScreen> createState() => _GeneScreenState();
}

class _GeneScreenState extends State<GeneScreen> {
  int genePage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: 'Gene ',

              ),
              TextSpan(
                text: '($genePage/4)',
                style: TextStyle(
                  color: Color(0xFF419D74),
                ),
              ),
            ],
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Color(0xFF1A5071), size: 40),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // TODO: Handle item 1
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // TODO: Handle item 2
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Color(0xFFFFFFFF),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 35.0, left: 25.0, right: 25.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}