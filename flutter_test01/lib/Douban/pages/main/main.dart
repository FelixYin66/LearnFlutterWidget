import 'package:flutter/material.dart';
import '../home/home.dart';
import '../group/group.dart';
import '../mall/mall.dart';
import '../profile/profile.dart';
import '../subject/subject.dart';

class HomeMainPage extends StatefulWidget {
  @override
  _HomeMainPageState createState() => _HomeMainPageState();
}

/*
* 1.需要注意当item个数大于4的话，需要单独设置一个属性为fix
*
* */
class _HomeMainPageState extends State<HomeMainPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: getPages(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: getNavigationBarItemList(),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (int index){
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  //创建不同界面
  List<Widget> getPages(){
    return [
      HomePage(),
      SubjectPage(),
      GroupPage(),
      MallPage(),
      ProfilePage(),
    ];
  }
//  List.generate(5, (int index){
//  return BottomNavigationBarItem(
//  title: Text('Item$index',style: TextStyle(fontSize: 20,color: Colors.red),),
//  icon: Image.asset('images/panda.png',width: 30,),
//  activeIcon: Image.asset('',width: 30,)
//  );
//  });
  //创建底部导航栏
  List<BottomNavigationBarItem> getNavigationBarItemList(){
    return [
      DouBanBottomNavigationBarItem('images/panda.png','images/panda.png','首页'),
      DouBanBottomNavigationBarItem('images/panda.png','images/panda.png','书影音'),
      DouBanBottomNavigationBarItem('images/panda.png','images/panda.png','小组'),
      DouBanBottomNavigationBarItem('images/panda.png','images/panda.png','市集'),
      DouBanBottomNavigationBarItem('images/panda.png','images/panda.png','我的'),
    ];
  }

}


class DouBanBottomNavigationBarItem extends BottomNavigationBarItem{
  DouBanBottomNavigationBarItem(String norimgname,String himgname,String title):super(
    title:Text(title),
    icon:Image.asset(norimgname,width: 30,),
    activeIcon:Image.asset(himgname,width: 30,)
  );
}
