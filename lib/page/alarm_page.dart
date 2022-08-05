import 'package:flutter/material.dart';

class AlarmPage extends StatelessWidget {
   List<Widget> list = <Widget>[
    ListTile(
      title: Text(
        '虛擬裝置一',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      subtitle: Text('虛擬裝置條件'),
      leading: Icon(
        Icons.circle_notifications,
        color: Color.fromARGB(210, 47, 59, 82),
        size: 40.0,
      ),
      trailing: Icon(
        Icons.build_rounded,
        color: Color.fromARGB(210, 47, 59, 82),
        size: 40.0,
      )
    ),
    ListTile(
      title: Text(
        '虛擬裝置二',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      subtitle: Text('虛擬裝置條件'),
      leading: Icon(
        Icons.circle_notifications,
        color: Color.fromARGB(210, 47, 59, 82),
        size: 40.0,
      ),
      trailing: Icon(
        Icons.build_rounded,
        color: Color.fromARGB(210, 47, 59, 82),
        size: 40.0,
      )
    ),
    ListTile(
      title: Text(
        '虛擬裝置三',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
      ),
      subtitle: Text('虛擬裝置條件'),
      leading: Icon(
        Icons.circle_notifications,
        color: Color.fromARGB(210, 47, 59, 82),
        size: 40.0,
      ),
      trailing: Icon(
        Icons.build_rounded,
        color: Color.fromARGB(210, 47, 59, 82),
        size: 40.0,
      )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      //列表元件
      child: ListView(
        children: list,
      ),
    );
  }
}