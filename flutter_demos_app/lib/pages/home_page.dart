import 'package:flutter/material.dart';
import 'index.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<String> list = List();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }

  void initData(){
    list..add("一个不简单搜索框")..add("流式布局")..add("展开闭合列表")..add("贝塞尔曲线")..add("右滑返回")..add("ToolTip控件")..add("Draggable控件实例");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
//        //custom leading buttom
//        leading: IconButton(
//          icon: Icon(Icons.menu),
//          tooltip: 'Navigreation',
//          onPressed: () => debugPrint('Navigreation button is pressed'),
//        ),
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              debugPrint('Search button is pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            tooltip: 'More',
            onPressed: () => debugPrint('More button is pressed'),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child:Column(children: <Widget>[
            ListTile(title:Text("demos")),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  String title = list[index];
                  return ListTile(
                    title: Text("$title"),
                    onTap: (){
                      itemClick(index);
                    },
                  );

                },



              ),
            ),
          ])
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

// ListView item click
  void itemClick(int index){
    print("item click  $index");
    if(index == 0){
      Navigator.of(context).push(
          MaterialPageRoute(builder:(BuildContext context){
            return SearchBarWidget();
          })
      );
    }
    else if(index == 1){
      Navigator.of(context).push(
          MaterialPageRoute(builder:(BuildContext context){
            return WarpWidget();
          })
      );
    }
    else if(index == 2){
      Navigator.of(context).push(
          MaterialPageRoute(builder:(BuildContext context){
            return ExpansionPanelListWidget();
          })
      );
    }
    else if(index == 3){
      Navigator.of(context).push(
          MaterialPageRoute(builder:(BuildContext context){
            return BezierCurveWidget();
          })
      );
    }
    else if(index == 4){
      Navigator.of(context).push(
          MaterialPageRoute(builder:(BuildContext context){
            return RightBackWidget();
          })
      );
    }
    else if(index == 5){
      Navigator.of(context).push(
          MaterialPageRoute(builder:(BuildContext context){
            return ToolTipWidget();
          })
      );
    }
    else if(index == 6){
      Navigator.of(context).push(
          MaterialPageRoute(builder:(BuildContext context){
            return DraggablePage();
          })
      );
    }





  }



}
