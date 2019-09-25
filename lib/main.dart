import 'package:flutter/material.dart';

// void main() => runApp(FirstView());

// void main() => runApp(ListTestApp(
//   //我们使用的是一个List传递，然后直接用List中的generate方法进行生产List里的元素。第一个参数是生生成的个数，第二个是方法。
//   items: new List<String>.generate(100, (i)=>"Item $i"),
// ));

//测试导航&跳转
// void main(){
//   runApp(MaterialApp(
//   title: 'useless',
//   home: new FirstView(),
// ));
// }

//页面跳转
//Navigator.push:是跳转到下一个页面，它要接受两个参数 一个是上下文context，另一个是跳转的函数
//Navigator.pop:是返回到上一个页面，使用时传递一个context参数，使用时要注意的是，你必须是有上级页面的
class FirstView extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
          appBar: AppBar(
            title: new Text('第一个页面'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (context)=> new SecondPage()
                    ));
                  },
                )
              ],
            ),
          ),
        );
    }
}

class SecondView extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: new Text('第二个页面'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('返回'),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
      );
    }
}

//导航参数的传递和接受
//声明数据结构类

// void main() {
//   runApp(MaterialApp(
//     title: 'useless',
//     home: ProductList(
//       proList: List.generate(20, (i)=>Product('商品 $i','这是一个商品，编号为：$i')),
//     ),
//   ));
// }

class Product {
  final String title;
  final String description;
  Product(this.title, this.description);
}

class ProductList extends StatelessWidget {
  final List<Product> proList;
  ProductList({Key key, @required this.proList}):super(key:key);
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
          appBar: AppBar(
            title: new Text('商品列表'),
          ),
          body: ListView.builder(
            itemCount: proList.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(proList[index].title),
                onTap: (){
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (context)=> new ProductDetail(
                        detail: proList[index],
                      )
                    ));
                },
              );
            },
          ),
        );
    }
}
//商品详情页
class ProductDetail extends StatelessWidget {
  final Product detail;
  ProductDetail({Key key, @required this.detail}):super(key:key);
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: new Text('商品详情'),
        ),
        body: Center(
          child: Text('${detail.description}'),
        ),
      );
    }
}

//页面跳转并返回数据
//Dart中的异步请求和等待直接使用async...await
void main() {
  runApp(MaterialApp(
    title: 'useless',
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: new Text('页面跳转并返回数据'),
        ),
        body: Center(
          child: RouteButton(),
        ),
      );
    }
}

class RouteButton extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return RaisedButton(
        onPressed: (){
          _navigateToSecondPage(context);
        },
        child: Text('点击跳转'),
      );
    }

    _navigateToSecondPage(BuildContext context) async{
       final result = await Navigator.push(context, MaterialPageRoute(
          builder: (context)=>new SecondPage()
       ));

       Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result'),));
    }
}

class SecondPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: Text('第二个page'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('这是一个按钮'),
                onPressed: (){
                  Navigator.pop(context,'11111');
                },
              ),
              RaisedButton(
                child: Text('这是第二个按钮'),
                onPressed: (){
                  Navigator.pop(context,'22222');
                },
              ),
              Text('fffff'),
              Image.asset('Images/WechatIMG18.jpeg')
            ],
          ),
        ),
      );
    }
}


//MARK-----------------------以下是控件---------------------------------------------------------------------------------

//网格列表组件
//crossAxisSpacing ：网格间的空当，相当于每个网格之间的间距
//crossAxisCount ：网格的列数，相当于一行放置的网格数量
//childAspectRatio : 宽高比
class MyGridApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new MaterialApp(
          title: 'useless',
          home: Scaffold(
            appBar: AppBar(
              title: new Text('网格'),
            ),
            body: GridView.count(
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              children: <Widget>[
                new Image.network('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=317335006,3693914419&fm=26&gp=0.jpg',fit: BoxFit.cover),
                const Text('这是第一个'),
                const Text('这是第二个'),
                const Text('这是第三个'),
                const Text('这是第四个'),
                const Text('这是第五个'),
                const Text('这是第六个'),
                const Text('这是第七个'),
              ],
            ),
          ),
      );
    }
}

//一个带数据源的列表
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
           appBar: AppBar(
             title: new Text('带传入数据的列表'),
           ),
           body: new ListView.builder(
             itemCount: items.length,
             itemBuilder: (context, index){
               return new ListTile(
                 title: new Text('${items[index]}'),
               );
             },
           )
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

//MARK: 组件封装
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

