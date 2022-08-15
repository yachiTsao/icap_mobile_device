import 'package:flutter/material.dart';

import 'page/home_page.dart';
import 'page/alarm_page.dart';
import 'page/device_page.dart';
import 'page/setting_pade.dart';


void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值

  final pages = [HomePage(), AlarmPage(), DevicePage() ,SettingPage()];

  @override
  Widget build(BuildContext context) {
    // getHttp();
    return new Scaffold(
      appBar: AppBar(
        title: Text('iCAP'),
        backgroundColor: Color.fromARGB(210, 47, 59, 82),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(210, 47, 59, 82),
        child: ListView(
          children: <Widget>[
            //設定用户名稱
            UserAccountsDrawerHeader(
               decoration: BoxDecoration(
                  color: Color.fromARGB(210, 47, 59, 82),
                ),
              accountName: new Text(
                "iCAP 使用者",
                style: TextStyle(
                  color: Color.fromARGB(250, 146, 164, 199)
                )
              ),
              //設定Email
              accountEmail: new Text(
                "IPAIntern@gmail.com",
                style: TextStyle(
                  color: Color.fromARGB(250, 146, 164, 199)
                )
              ),
              //設定大頭照
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Color.fromARGB(250, 146, 164, 199),
              ),
            ),
            //選單
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.home_rounded,
              color: Color.fromARGB(249, 187, 209, 252)),
              backgroundColor: Color.fromARGB(210, 47, 59, 82)),
              title: Text('首頁',
              style: TextStyle(
                  color: Color.fromARGB(249, 187, 209, 252)
                )
              ),
              onTap: () {
                _onItemClick(0);
              },
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.notifications_active_rounded,
              color: Color.fromARGB(249, 187, 209, 252)),
              backgroundColor: Color.fromARGB(210, 47, 59, 82)),
              title: Text('通知列表',
              style: TextStyle(
                  color: Color.fromARGB(249, 187, 209, 252)
                )),
              onTap: () {
                _onItemClick(1);
              },
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.devices_rounded,
              color: Color.fromARGB(249, 187, 209, 252)),
              backgroundColor: Color.fromARGB(210, 47, 59, 82)),
              title: Text('裝置列表',
              style: TextStyle(
                  color: Color.fromARGB(249, 187, 209, 252)
                )),
              onTap: () {
                _onItemClick(2);
              },
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.settings_sharp,
              color: Color.fromARGB(249, 187, 209, 252)),
              backgroundColor: Color.fromARGB(210, 47, 59, 82)),
              title: Text('設定',
              style: TextStyle(
                  color: Color.fromARGB(249, 187, 209, 252)
                )),
              onTap: () {
                _onItemClick(3);
              },
            ),
          ],
        ),
      ),
      body: pages[_currentIndex],
    );
  }

  void _onItemClick(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.of(context).pop();
    });
  }
}

