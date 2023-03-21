import 'package:balanstate_test02/componnent/down_triangle_painter.dart';
import 'package:balanstate_test02/componnent/health_state.dart';
import 'package:balanstate_test02/const/const.dart';
import 'package:balanstate_test02/const/health_icon_state.dart';
import 'package:flutter/material.dart';

class BalanStateHomeScreen extends StatefulWidget {
  const BalanStateHomeScreen({Key? key}) : super(key: key);

  @override
  State<BalanStateHomeScreen> createState() => _BalanStateHomeScreenState();
}

class _BalanStateHomeScreenState extends State<BalanStateHomeScreen> {
  final String health = 'Positive';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 26.0,
              color: Color(0xFF419D74),
              fontWeight: FontWeight.w900,
            ),
            children: [
              TextSpan(
                text: 'Balan',
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'State',
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
      body: Container(
        color: Color(0xFFFFFFFF),
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 30.0, left: 25.0, right: 25.0, top: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header
                    _Hearder(),

                    SizedBox(
                      height: 20.0,
                    ),
                    // Content
                    _Content(health: health),

                    SizedBox(
                      height: 30.0,
                    ),

                    // Footer
                    _Footer(healthStateIcon: healthStateIcon),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Hearder extends StatelessWidget {
  const _Hearder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 20.5,
              color: PRIMARY_COLOR,
            ),
            children: [
              TextSpan(
                text: 'Your current health score is ',
              ),
              TextSpan(
                text: 'Normal',
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          'asset/img/dashboard.png',
          height: 185,
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final String health;
  const _Content({required this.health, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'My health expect',
          style: TextStyle(
              color: PRIMARY_COLOR,
              fontSize: 19.0,
              fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  health == 'Negative'
                      ? Transform.rotate(
                          angle: 3.14,
                          child: CustomPaint(
                            size: Size(18, 14),
                            painter: DownTrianglePainter(),
                          ),
                        )
                      : Text(''),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  health == 'Keep'
                      ? Transform.rotate(
                          angle: 3.14,
                          child: CustomPaint(
                            size: Size(18, 14),
                            painter: DownTrianglePainter(),
                          ),
                        )
                      : Text(''),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  health == 'Positive'
                      ? Transform.rotate(
                          angle: 3.14,
                          child: CustomPaint(
                            size: Size(18, 14),
                            painter: DownTrianglePainter(),
                          ),
                        )
                      : Text(''),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 9,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.orange,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Negative',
                  style: health == 'Negative'
                      ? TextStyle(fontWeight: FontWeight.w500)
                      : TextStyle(color: TEXT_COLOR),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Keep',
                  style: health == 'Keep'
                      ? TextStyle(fontWeight: FontWeight.w500)
                      : TextStyle(color: TEXT_COLOR),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Positive',
                  style: health == 'Positive'
                      ? TextStyle(fontWeight: FontWeight.w500)
                      : TextStyle(color: TEXT_COLOR),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  final List<Map<String, dynamic>> healthStateIcon;
  const _Footer({required this.healthStateIcon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (int i = 0; i < 3; i++)
              Expanded(
                child: TextButton(
                  onPressed: () {
                    print('/${healthStateIcon[i]['name']}');
                    Navigator.of(context).pushNamed(
                      '/${healthStateIcon[i]['name']}',
                    );
                  },
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    minimumSize: MaterialStateProperty.all<Size>(Size.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: HealthState(
                    name: healthStateIcon[i]['name'],
                    iconName: healthStateIcon[i]['icon'],
                    state: healthStateIcon[i]['state'],
                  ),
                ),
              ),
          ],
        ),
        SizedBox(
          height: 13.0,
        ),
        Row(
          children: [
            for (int i = 3; i < 6; i++)
              Expanded(
                child: TextButton(
                  onPressed: () {
                    print('/${healthStateIcon[i]['name']}');
                    Navigator.of(context).pushNamed(
                      '/${healthStateIcon[i]['name']}',
                    );
                  },
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    minimumSize: MaterialStateProperty.all<Size>(Size.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: HealthState(
                    name: healthStateIcon[i]['name'],
                    iconName: healthStateIcon[i]['icon'],
                    state: healthStateIcon[i]['state'],
                  ),
                ),
              ),
          ],
        ),
        SizedBox(
          height: 13.0,
        ),
        Row(
          children: [
            for (int i = 6; i < 9; i++)
              Expanded(
                child: TextButton(
                  onPressed: () {
                    print('/${healthStateIcon[i]['name']}');
                    Navigator.of(context).pushNamed(
                      '/${healthStateIcon[i]['name']}',
                    );
                  },
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    minimumSize: MaterialStateProperty.all<Size>(Size.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: HealthState(
                    name: healthStateIcon[i]['name'],
                    iconName: healthStateIcon[i]['icon'],
                    state: healthStateIcon[i]['state'],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
