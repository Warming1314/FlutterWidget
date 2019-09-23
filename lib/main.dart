import 'package:flutter/material.dart';

void main() => runApp(MyContainer());

// void main() => runApp(ListTestApp(
//   items: new List<String>.generate(100, (i)=>"Item $i"),
// ));

class ListTestApp extends StatelessWidget {
   final List<String> items;
   //这是一个构造函数，除了Key 我们增加了一个必传的参数，这里的@required意思就是必传。：super如果父类没有无名无参数的默认构造函数，
   //则子类必须手动调用一个父类构造函数。
   ListTestApp({Key key,@required this.items}):super(key:key);
    @override
      Widget build(BuildContext context) {
        // TODO: implement build
        return MaterialApp(
          title: 'useless',
          home: Scaffold(
            body: Center(
              child: Container(
                height: 200,
                width: 100,
                color: Colors.red,
              ),
            ),
          ),
        );
      }
}


//Text属性
//TextAlign 属性就是文本对齐方式，属性值有center left right start end（以文本结尾处对其，不常用）
//maxLines  设置最多显示的行数
//overflow  设置文本溢出时如何处理。属性值有clip（直接切断）ellipsis（显示省略号）fade（溢出的部分进行一行渐变消失的效果，上线渐变）
//style     有点像富文本，可以设置字号、颜色、背景颜色、下划线，样式等等。
class TextDemo extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        title: 'Text Practice',
        home: Scaffold(
          body: Center(
            child: Text(
              'Text practice Text practice Text practice Text practice Text practice Text practice Text practice Text practice Text practice',
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 25.0,
                color: Color.fromARGB(255, 255, 150, 150),
                backgroundColor: Colors.red,
                decoration: TextDecoration.underline,//上划线，下划线，删除线或者无
                decorationStyle: TextDecorationStyle.dotted,//线的样式：断点，波浪等
              ),
              ),
          ),
        ),
      );
    }
}

//Container容器组件
//child  子控件
//alignment 针对的是Container内child的对齐方式，也就是容器子内容的对齐方式，并不是容器本身的对齐方式
//width height color 宽 长 颜色 
//padding  内边距，指的是Container边缘和child内容的距离
//margin   外边距，指的是Container和外部元素的距离
//decoration 是container的修饰器，主要功能是设置背景和边框。注意：设置了这个属性就不要设置color，不然会报错。
class MyContainer extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
       return MaterialApp(
         title: 'Container Practice',
         home: Scaffold(
           body: Center(
             child: Container(
               child: new Text(
                 'Hello Container Text,Hello Container Text,Hello Container Text,Hello Container Text  End',
                 textAlign: TextAlign.left,
                 overflow:TextOverflow.ellipsis,
                 maxLines: 3,
                 style: TextStyle(
                   fontSize: 20.0,
                   color: Color.fromARGB(255, 122, 222, 122),
                   backgroundColor: Colors.red
                 ),
               ),
               alignment: Alignment.topLeft,
               width: 600,
               height: 300,
               //color: Colors.lightBlue,
               //padding: const EdgeInsets.all(10.0),
               padding: const EdgeInsets.fromLTRB(10.0, 30.0, 20.0, 5.0),
               margin: const EdgeInsets.all(10.0),
               decoration: new BoxDecoration(
                 gradient: const LinearGradient(//设置了一个渐变色
                   colors: [Colors.lightBlue,Colors.greenAccent,Colors.purple]
                 ),
                 border: Border.all(width: 2.0, color: Colors.red),
               ),
             ),
           ),
         ),
       );
    }
}

//Image图片组件
//加入图片的几种方式：Image.asset:加载资源图片，就是加载项目资源目录中的图片，加入图片后会增大打包的包体积，用的是相对路径
//Image.network: 网络资源图片。  Image.file:加载本地图片，绝对路径，跟包体无关。 Image.memory: 加载Uint8List资源图片，很少用。
class MyImage extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        title: 'MyImage Practice',
        home: Scaffold(
          body: Center(
            child: Container(
              child: new Image.network(
                'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=317335006,3693914419&fm=26&gp=0.jpg',
                height: 100,
                width: 100,
                // scale: 0.5,
                fit: BoxFit.cover,
                alignment: Alignment.center,
                // color: Colors.lightGreen,//是要混合颜色
                // colorBlendMode:BlendMode.darken,//混合模式，相当于我们如何混合
                //repeat: ImageRepeat.repeat,
              ),
              width: 300,
              height: 400,
              color: Colors.lightBlue,
            ),
          ),
        ),
      );
    }
}

//ListView列表组件
//列表元素可以是任何widget
class MyListView extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        title: 'MyListView',
        home: Scaffold(
          appBar: new AppBar(
            title: new Text('AppBar Text')
          ),
          //body: new Text(' ListView Text',textAlign: TextAlign.center),
          body: new ListView(
             scrollDirection: Axis.vertical,
             children: <Widget>[
               new Text('第一行'),
               new Image.network('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=317335006,3693914419&fm=26&gp=0.jpg',fit:BoxFit.contain),
               new ListTile(
                 title: new Text('这是一个 ListTile'),
                 leading: Icon(Icons.access_alarm),
               ),
               new Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568806784975&di=93c44bb7377e916666741b5c1f57f4cc&imgtype=0&src=http%3A%2F%2Fpic.51yuansu.com%2Fpic3%2Fcover%2F03%2F45%2F30%2F5ba4b40c9a2bb_610.jpg',fit:BoxFit.contain),
               new Image.network('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=317335006,3693914419&fm=26&gp=0.jpg',fit:BoxFit.contain),
            //     leading: new Icon(Icons.access_time),
            //     title: new Text('第一行'),
            //   ),
            //   new ListTile(
            //     leading: Icon(Icons.access_time),
            //     title: new Text('第二行'),
            //   )
            ],
          )
        ),
      );
    }
}

//横向ListView  horizontal
class horizontalList extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        title: 'useless',
        home: Scaffold(
          appBar: new AppBar(
            title: new Text('横向列表的标题'),
          ),
          body: Center(
            child: new Container(
              height: 200,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  new Container(
                    width: 180,
                    color: Colors.lightBlue,
                  ),
                  new Container(
                    width: 180,
                    color: Colors.amber,
                  ),
                  new Container(
                    width: 180,
                    color: Colors.deepOrange,
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    }
}

//组件封装
class MyList extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return ListView(
        children: <Widget>[
          new Container(
            height: 200.0,
            color: Colors.lightBlue,
          ),
          new Container(
            height: 200.0,
            color: Colors.amber,
          ),
          new Container(
            height: 200.0,
            color: Colors.deepOrange,
          ),
        ],
      );
    }
}

class TestApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        title: 'useless',
        home: Scaffold(
          appBar: AppBar(
            title: new Text('组合测试'),
          ),
          body: MyList(),
        ),
      );
    }
}

//

