import 'package:flutter/material.dart';

class BaseWidgetTest001App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseWidgetTest001AppHome(),
    );
  }
}

class BaseWidgetTest001AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text练习',
           style: TextStyle(fontSize: 20,color: Colors.white),
        ),
      ),
      body: BaseWidgetTest001HomeBody(),
    );
  }
}

class BaseWidgetTest001HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      TextWidget(),
      SizedBox(height: 30),
      ButtonWidget(),
      SizedBox(height: 30),
      ImageWidget(),
      SizedBox(height: 30),
      TextFieldWidget(),
      FormWidget(),
    ]
    );
  }
}

//文本Widge练习
class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Text基本属性及富文本',
            style: TextStyle(fontSize: 30,color: Colors.red),
          ),
          SizedBox(height: 15),
          Text(
            "《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。。。。。。。。。。",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
            //文本布局方式（从左到右还是从右到左）
            textDirection: TextDirection.ltr,
            //文本对齐方式
            textAlign: TextAlign.center,
            //超出部分如何显示，以ellipsis显示（...）
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            //控制文本缩放
            textScaleFactor: 1,

          ),
          SizedBox(
            height:30 ,
          ),
          Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: '《定风波》',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600)),
                  TextSpan(text: '苏轼',style: TextStyle(fontSize: 15)),
                  TextSpan(text: '\n莫听穿林打叶声,何妨吟啸且徐行'),
                  TextSpan(text: '\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生'),
                  TextSpan(text: '\n'),
                ]
            ),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17),
          )
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '不同Button',
            style: TextStyle(fontSize: 30,color: Colors.red),
          ),
          SizedBox(height: 15),
          RaisedButton(
            onPressed: (){
              print('RainseButton');
            },
            child: Text(
              'RaiseButton',
              style: TextStyle(fontSize: 18,color: Colors.black),
            ),
            color: Colors.green,
            highlightColor: Colors.yellowAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          SizedBox(height: 15),
          FloatingActionButton(
            onPressed: (){
              print('FloatingActionButton');
            },
            child: Text(
              'FloatingActionButton',
              style: TextStyle(fontSize: 18,color: Colors.redAccent),
            ),
            foregroundColor: Colors.red,
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          SizedBox(height: 15),
          FlatButton(
            onPressed: (){
              print('FlatButton');
            },
            child: Text(
              'FlatButton',
              style: TextStyle(fontSize: 18,color: Colors.black),
            ),
            color: Colors.blue,
            highlightColor: Colors.yellowAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          OutlineButton(
            onPressed: (){
              print('OutlineButton');
            },
            child: Text(
              'OutlineButton',
              style: TextStyle(fontSize: 18,color: Colors.black),
            ),
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}

/*
* 本地图片需要在pubspec.yaml配置文件中配置
* 需要添加标签：
* assets：
* - images/panda.png
*
* */
class ImageWidget extends StatelessWidget {
  final String imgURL = 'http://a0.att.hudong.com/16/12/01300535031999137270128786964.jpg';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Image使用及加载方式',
          style: TextStyle(fontSize: 30,color: Colors.red),
        ),
        SizedBox(height: 15),
        //加载网络图片
        Image.network(imgURL),
        SizedBox(height: 15),
        Image.asset('images/panda.png'),
        SizedBox(height: 15),
        CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage(imgURL),
          child: Container(
            child: Text(
              'CircleAvatar',
              style: TextStyle(fontSize: 20,color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            width: 200,
            height: 200,
            color: Colors.black26,
            alignment: Alignment(0,0),
          ),
        ),
        SizedBox(height: 15,),
        ClipOval(
          child: Image.network(
              imgURL,
            width: 200,
            height: 200,
//            color: Colors.black38,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
              imgURL,
              width: 200,
              height: 200,
//            color: Colors.black38,
          ),
        )
      ],
    );
  }
}


class TextFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'TextField使用',
          style: TextStyle(fontSize: 30,color: Colors.red),
        ),
        SizedBox(height: 15),
        TextFieldWidgetContainer()
      ],
    );
  }
}


class TextFieldWidgetContainer extends StatefulWidget {
  @override
  _TextFieldWidgetContainerState createState() => _TextFieldWidgetContainerState();
}

class _TextFieldWidgetContainerState extends State<TextFieldWidgetContainer> {
  //添加一个Controller管理TextField
//  final TextEditingController textController = TextEditingController();
  final TextFieldController textController = TextFieldController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.text = '初始化内容4444';
    textController.addListener(
        (){
          print('textController:$textController.text');
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.numberWithOptions(signed: true,decimal: false),
      decoration: InputDecoration(
          icon: Icon(Icons.phone),
          labelText: 'LabelText',
          hintText: 'hintText',
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled:true,
          fillColor: Colors.black38
      ),
      controller: textController,
      onChanged: (String text){
        print('Text onChanged');
      },
      onSubmitted: (String text){
        print('Text onSubmitted');
      },
      onEditingComplete: (){
        print('Text onEditingComplete');
      },
    );
  }
}


class TextFieldController extends TextEditingController{
//  //添加一个自定义的构造方法，传入自定义初始化字符串；并添加监听方法
//  TextFieldController.withPlaceHolder(String placeholder){
//    this.text = placeholder;
//  }
//
//  @override
//  void addListener(listener) {
//    // TODO: implement addListener
//    super.addListener(listener);
//  }

}

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  //通过获取当前State
  final registerFormKey = GlobalKey<FormState>();
  String name,pwd;
  @override


  void registerForm(){
    registerFormKey.currentState.save();
    registerFormKey.currentState.validate();
    print('name === $name  pwd === $pwd');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Form使用',
          style: TextStyle(fontSize: 20,color: Colors.red),
        ),
        SizedBox(height: 20,),
        Form(
          key: registerFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onSaved: (String text){
                  name = text;
                  print('用户名 $text');
                },
                validator: (String validate){
                  print('Validate === $validate');
//                  return "用户名错误";
                  return null;
                },
                keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
                decoration: InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: '请输入用户名',
                  labelText: '用户名',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                onSaved: (String text){
                  pwd = text;
                  print('密码 $text');
                },
                validator: (String validate){
                  print('Validate === $validate');
//                  return "密码错误";
                  return null;
                },
                obscureText: true,
                keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
                decoration: InputDecoration(
                  icon: Icon(Icons.pages),
                  hintText: '请输入登录密码',
                  labelText: '登录密码',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(2),),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 44,
                child: FlatButton(
                  child: Text(
                    '登 录',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: registerForm,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}






