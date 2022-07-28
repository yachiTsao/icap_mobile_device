import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  // debugPaintSizeEnabled =true; 輔助線
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(210,47, 59, 82),
            title: Text('iCAP mobile device'),
          ),
          body: HomePage(),
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Color.fromARGB(255, 11, 23, 44)
      ),
      child: Center(
        child: Table(
          // border: TableBorder(
          //     horizontalInside: BorderSide(width: 1,
          //     color: Colors.blue,
          //     style: BorderStyle.solid),
          // ),
          border: TableBorder.symmetric(
              inside: BorderSide(width: 1, color: Color.fromARGB(210,47, 59, 82)),
              outside: BorderSide(width: 1, color: Color.fromARGB(210,47, 59, 82))),
          defaultColumnWidth: FixedColumnWidth(150),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const <int, TableColumnWidth>{
            //設定每行的寬度
            1: FixedColumnWidth(60.0),
            2: FixedColumnWidth(80.0),
            3: FixedColumnWidth(100.0),
            4: FixedColumnWidth(100.0)
          },
          //設定表格樣式
          // border: TableBorder.all(
          //     color: Color.fromARGB(255, 255, 255, 255),
          //     width: 2.0,
          //     style: BorderStyle.solid),
          children: <TableRow>[
            TableRow(
              decoration: BoxDecoration(color: Color.fromARGB(210,47, 59, 82)),
              children: <Widget>[
                Text('裝置名稱',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                Text('條件',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                Text('時間',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                Text(''),
              ],
            ),
            TableRow(
              children: <Widget>[
                Text('Test Device 1',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(250, 146, 164, 199)
              ),
            ),
                Text('MEM.Usage>10',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                Text('weekend',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('解決',
                      style: TextStyle(
                          color: Color.fromARGB(250, 234, 241, 255)
                      )),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromARGB(252, 30, 135, 217),
                    shape: StadiumBorder(),
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: BoxDecoration(color: Color.fromARGB(210,47, 59, 82)),
              children: <Widget>[
                Text('Test Device 2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                Text('MEM.Usage>10',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                Text('weekend',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('解決',
                      style: TextStyle(
                          color: Color.fromARGB(250, 234, 241, 255)
                      )),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromARGB(252, 30, 135, 217),
                    shape: StadiumBorder(),
                  ),
                ),
              ],
            ),
            TableRow(
              children: <Widget>[
                Text('Test Device 3',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                Text('MEM.Usage>10',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                Text('weekend',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('解決',
                      style: TextStyle(
                          color: Color.fromARGB(250, 234, 241, 255)
                      )),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromARGB(252, 30, 135, 217),
                    shape: StadiumBorder(),
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: BoxDecoration(color: Color.fromARGB(210,47, 59, 82)),
              children: <Widget>[
                Text('Test Device 4',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                Text('MEM.Usage>10',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                Text('weekend',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(250, 146, 164, 199)
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('解決',
                      style: TextStyle(
                      color: Color.fromARGB(250, 234, 241, 255)
                  )),
                  style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromARGB(252, 30, 135, 217),
                  shape: StadiumBorder(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}