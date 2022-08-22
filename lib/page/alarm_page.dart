import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AlarmPage extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

Map<String, dynamic> data = {};
var dataArray = [];

void initData() {
  data = {};
  dataArray = [];
}

Future getData() async {
  // print('sta_data: ${data}');
  try {
    String url =
        'http://10.204.16.110:3000/api/v1/alarm/list?pageSize=1024&page=0&sortProperty=startTime&sortOrder=DESC&searchStatus=UNCLEARED';
    final deviceList =
        await http.get(url); // The type of deviceList is response
    Map alarmListFromJson = jsonDecode(deviceList
        .body); // The type of alarmListFromJson is Map<String, dynamic>
    var alarmList = alarmListFromJson['data']['list'];

    for (int i = 0; i < alarmList.length; i++) {
      String alarmId = alarmList[i]['alarmId'];
      String deviceName = alarmList[i]['device']['name'];
      String deviceDetail = alarmList[i]['details']['msg'];
      int deviceTimeData = alarmList[i]['startTime'];
      var deviceTime = DateTime.fromMillisecondsSinceEpoch(deviceTimeData);
      data = {
        'alarmId': alarmId,
        'deviceName': deviceName,
        'deviceDetail': deviceDetail,
        'deviceTime': deviceTime,
      };
      dataArray.add(data);
    }
    print('get data: ${dataArray}');
  } catch (e) {
    print('caught error : $e');
  }
}

Future postData(removeData) async {
  String alarmId = removeData['alarmId'];
  try {
    String url = 'http://10.204.16.110:3000/api/v1/alarm/${alarmId}/clear';
    // print(url);
    final result = await http.post(url);
    print(result.statusCode);
    dataArray.remove(removeData);
    print('remove item');
  } catch (e) {
    print('caught error : $e');
  }
}

void showMySnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: const Text('已解除裝置通知'),
    backgroundColor: Color.fromARGB(255, 47, 59, 82),
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: '復原',
      textColor: Color.fromARGB(248, 123, 201, 247),
      onPressed: () {
        print('復原...');
      },
    ),
  ));
}

class _LoadingState extends State<AlarmPage> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    getData();
    print('alarm list initState');
  }

  void _reBuiltList() async {
    initData();
    await getData();
    print('after rebuilt data: ${dataArray}');
    setState(() {
      _count++;
      print(_count);
    });
  }

  final Future<List<dynamic>> _calculation = Future<List<dynamic>>.delayed(
    const Duration(seconds: 2),
    () => dataArray,
  );

  @override
  Widget build(BuildContext context) {
    print("data length: ${dataArray.length}");
    print(dataArray);
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<List<dynamic>>(
        future: _calculation, 
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          List<Widget> children;
          if (snapshot.connectionState == ConnectionState.done) {
            if (dataArray.length == 0) {
              print('empty result');
              return Align(
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    '沒有結果',
                    style: TextStyle(
                        fontSize: 20.0, color: Color.fromARGB(210, 47, 59, 82)),
                  ),
                ),
              );
            }
            snapshot = AsyncSnapshot.withData(ConnectionState.done, dataArray);
            return RefreshIndicator( //由上往下刷 refesh
                child: ListView.builder(
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
                                color: Color.fromARGB(210, 47, 59, 82),
                                size: 40.0),
                            onPressed: () async {
                              print('resolve button');
                              await postData(
                                  snapshot.requireData[index]); //remove
                              showMySnackBar(context);
                              _reBuiltList();
                            },
                          ));
                    }),
                onRefresh: () async {
                  return Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      _reBuiltList();
                    });
                  });
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
                  child: Text(
                    '通知列表載入中...',
                    style: TextStyle(fontSize: 40),
                  ))
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
