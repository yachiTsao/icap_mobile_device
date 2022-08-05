// import 'package:flutter/material.dart';
// import 'package:icap_mobile_device/main.dart';

// import 'page/DeviceListPage.dart';
// import 'page/HomePage.dart';

// void main() => runApp(MaterialApp(
//       home: DeviceListApp(),
//     ));

// class DeviceListApp extends StatefulWidget {
//   @override
//   _DeviceListAppState createState() => _DeviceListAppState();
// }

// class _DeviceListAppState extends State<DeviceListApp> {
//   //目前選擇的索引值
//   int _currentIndex = 0;

//   final pages = [HomePage()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('iCAP Devices List'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: Text(
//                 "USER NAME",
//               ),
//               accountEmail: Text(
//                 "asd@gmail.com",
//               ),
//               currentAccountPicture: CircleAvatar(
//                 backgroundImage: AssetImage("assets/images/logo.png"),
//               ),
//             ),
//             ListTile(
//               // leading: CircleAvatar(child: Icon(Icon.chrome_reader_mode)),
//               title: Text('iCAP Device List'),
//               onTap: () {
//                 _onItemClick(0);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: pages[_currentIndex],
//     );
//   }

//   void _onItemClick(int index){
//     setState(() {
//       _currentIndex = index;
//       Navigator.of(context).pop();
//     });
//   }
// }

import 'package:flutter/material.dart';

// import 'account.dart';
import './page/home_page.dart';
import 'page/alarm_page.dart';
import './page/device_page.dart';
import './page/setting_pade.dart';

void main() => runApp(
      new MaterialApp(
        home: new MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值

  final pages = [HomePage(), AlarmPage(), DevicePage() ,SettingPage()];

  @override
  Widget build(BuildContext context) {
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
                _onItemClick(2);
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