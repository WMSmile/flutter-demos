import 'package:flutter/material.dart';
import 'pages/index.dart';


class BottomNavigationWidget extends StatefulWidget {
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    // TODO: implement initState

    initData();

    super.initState();
  }
  //  初始化数据
  void initData(){
    list
      ..add(HomeScreen())
      ..add(PagesScreen())
      ..add(EmailScreen())
      ..add(AirplayScreen());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.home,
                  color:_BottomNavigationColor,
                ),
                title:Text(
                    'Home',
                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.email,
                  color:_BottomNavigationColor,
                ),
                title:Text(
                    'Email',
                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.pages,
                  color:_BottomNavigationColor,
                ),
                title:Text(
                    'Pages',
                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon:Icon(
                  Icons.airplay,
                  color:_BottomNavigationColor,
                ),
                title:Text(
                    'AipPlay',
                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (int index){
            setState(() {
              _currentIndex = index;
            });
          },
//          type:BottomNavigationBarType.fixed //文字大小风格
          type:BottomNavigationBarType.shifting //隐藏文字风格

      ),
    );
  }
}