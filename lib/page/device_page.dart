import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DevicePage extends StatefulWidget {
  @override
  _LoadingDeviceState createState() => _LoadingDeviceState();
}

Map<String, dynamic> deviceData = {};
var deviceDataArray = [];

void getDeviceData() async {
  try {
    String url =
        'http://10.204.16.110:3000/api/v1/devices?pageSize=1024&page=0&sortProperty=createdTime&sortOrder=DESC';
    final deviceListData = await http.get(url);
    Map DeviceListFromJson = jsonDecode(deviceListData.body);
    var deviceList = DeviceListFromJson['data']['list'];

    for (int i = 0; i < deviceList.length; i++) {
      String deviceId = deviceList[i]['id'];
      String deviceName = deviceList[i]['name'];
      String deviceType = deviceList[i]['type'];
      int deviceCreateTimeData = deviceList[i]['createdTime'];
      var deviceTime =
          DateTime.fromMillisecondsSinceEpoch(deviceCreateTimeData);
      deviceData = {
        'alarmId': deviceId,
        'deviceName': deviceName,
        'deviceType': deviceType,
        'deviceTime': deviceTime,
      };
      deviceDataArray.add(deviceData);
      // print('alarmList: ${deviceName} ${deviceType} ${deviceTime}');
    }
    // print('data: ${deviceDataArray}');
    // print('data length: ${deviceDataArray.length}');
    // print('data: ${data}');
  } catch (e) {
    print('caught error : $e');
  }
}

class _LoadingDeviceState extends State<DevicePage> {
  @override
  void initState() {
    super.initState();
    getDeviceData();
    print('initState');
  }

  final Future<List<dynamic>> _calculation = Future<List<dynamic>>.delayed(
    const Duration(seconds: 2),
    () => deviceDataArray,
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<List<dynamic>>(
        future: _calculation, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          List<Widget> children;
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.requireData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '${snapshot.requireData[index]['deviceName']}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20.0),
                    ),
                    subtitle: Text(
                        '裝置類型: ${snapshot.requireData[index]['deviceType']}\n建置時間: ${snapshot.requireData[index]['deviceTime']}'),
                    leading: Icon(
                      Icons.developer_board_rounded,
                      color: Color.fromARGB(210, 47, 59, 82),
                      size: 40.0,
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('裝置列表載入中...',
                style: TextStyle(fontSize: 40),
                ),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
