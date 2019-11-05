import 'package:flutter/material.dart';
import 'pages/index.dart';

class BottomAddAppBar extends StatefulWidget {
  _BottomAddAppBarState createState() => _BottomAddAppBarState();
}

class _BottomAddAppBarState extends State<BottomAddAppBar> {
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initData();
  }
//  init datas
  void initData(){
    list..add(EachView("home"))..add(EachView("me"));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context){
            return EachView('Add New Page');
          }));
        },
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //style
      body: list[_currentIndex],

      bottomNavigationBar: BottomAppBar(
        color:Colors.lightBlue,
        shape:CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                icon:Icon(Icons.home),
                color:Colors.white,
                onPressed:(){
                  print("home");
                  setState(() {
                    _currentIndex=0;
                  });
                }
            ),
            IconButton(
                icon:Icon(Icons.airport_shuttle),
                color:Colors.white,
                onPressed:(){
                  print("me");
                  setState(() {
                    _currentIndex=1;
                  });
                }
            ),
          ],
        ),
      )
      ,
    );
  }
}