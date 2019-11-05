import 'package:flutter/material.dart';

class ToolTipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text('tool tips Widget')),
        body:Center(
          child: Tooltip(
            message: '不要碰我，我怕痒',
//            child: Icon(Icons.all_inclusive),
            child: Image.network(  //网络图片
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572940375208&di=f91f6e872ad74b4fd3f0bcc774ed58a7&imgtype=0&src=http%3A%2F%2Fimg1.utuku.china.com%2Fuploadimg%2Fgame%2F20170327%2F0492d9af-6c36-4add-b584-ee3ae5b21605.jpg',
                scale: 2.0,  //进行缩放
                fit:BoxFit.cover  // 充满父容器
            ),
          ),
        )
    );
  }
}