import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:icap_mobile_device/page/home_page.dart';

class AlarmPage extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

Map<String, dynamic> data = {};
var dataArray = [];
void getData() async {
  // print('sta_data: ${data}');
  try {
    String url =
        'http://10.204.16.110:3000/api/v1/alarm/list?pageSize=10&page=0';
    final deviceList =
        await http.get(url); // The type of deviceList is response
    Map alarmListFromJson = jsonDecode(deviceList
        .body); // The type of alarmListFromJson is Map<String, dynamic>
    var alarmList = alarmListFromJson['data']['list'];
    print(alarmList.toList());

    for (int i = 0; i < alarmList.length; i++) {
      print(i);
      String deviceName = alarmList[i]['device']['name'];
      String deviceDetail = alarmList[i]['details']['msg'];
      int deviceTimeData = alarmList[i]['startTime'];
      var deviceTime = DateTime.fromMillisecondsSinceEpoch(deviceTimeData);
      data = {
        'deviceName': deviceName,
        'deviceDetail': deviceDetail,
        'deviceTime': deviceTime,
      };
      dataArray.add(data);
      // print('alarmList: ${deviceName} ${deviceDetail} ${deviceTime}');
    }
    print('data: $dataArray');
    // print('data: ${data}');
  } catch (e) {
    print('caught error : $e');
  }
}

class _LoadingState extends State<AlarmPage> {
  @override
  void initState() {
    super.initState();
    getData();
    print('initState');
  }

  final Future<List<dynamic>> _calculation = Future<List<dynamic>>.delayed(
    const Duration(seconds: 2),
    () => dataArray,
  );
  @override
  Widget build(BuildContext context) {
    print("date length: ${data.length}");
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
                          '條件: ${snapshot.requireData[index]['deviceDetail']}\n時間: ${snapshot.requireData[index]['deviceTime']}'),
                      leading: Icon(
                        Icons.circle_notifications,
                        color: Color.fromARGB(210, 47, 59, 82),
                        size: 40.0,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.build_rounded,
                            color: Color.fromARGB(210, 47, 59, 82), size: 40.0),
                        onPressed: () {
                          print("button_1");
                        },
                      ));
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
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
