import 'package:flutter/material.dart';
import 'package:icap_mobile_device/main.dart';

import 'page/DeviceListPage.dart';

void main() => runApp(new MaterialApp(
      home: new DeviceListApp(),
    ));

class DeviceListApp extends StatefulWidget {
  @override
  _DeviceListAppState createState() => _DeviceListAppState();
}

class _DeviceListAppState extends State<DeviceListApp> {
  int _currentIndex = 0;

  final pages = [HomePage()];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('iCAP Devices List'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text(
                "USER NAME",
              ),
              accountEmail: new Text(
                "asd@gmail.com",
              ),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new AssetImage("assets/images/logo.png"),
              ),
            ),
            ListTile(
              // leading: new CircleAvatar(child: Icon(Icon.chrome_reader_mode)),
              title: Text('iCAP Device List'),
              onTap: () {
                _onItemClick(0);
              },
            ),
          ],
        ),
      ),
      body: pages[_currentIndex],
    );
  }

  void _onItemClick(int index){
    setState(() {
      _currentIndex = index;
      Navigator.of(context).pop();
    });
  }
}
