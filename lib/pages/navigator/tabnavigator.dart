import 'package:flutter/material.dart';
import 'package:superiorcurrency/pages/coin/coin_page.dart';
import 'package:superiorcurrency/pages/means/means_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:superiorcurrency/utils/event_utils.dart';
import '../../colors/my_colors.dart';
import '../../utils/my_toast_utils.dart';
import '../home/home_page.dart';

class Tab_Navigator extends StatefulWidget {
  const Tab_Navigator({Key? key}) : super(key: key);

  @override
  State<Tab_Navigator> createState() => _Tab_NavigatorState();
}

class _Tab_NavigatorState extends State<Tab_Navigator> {
  final _defaultColor = MyColors.ziGry;
  final _activetColor = MyColors.ziYellow;
  int _currentIndex = 0;
  //定义个变量，检测两次点击返回键的时间，如果在1秒内点击两次就退出
  DateTime? lastPopTime = null;

  late PageController _controller ;

  //监听
  var listen;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _controller = PageController(
      initialPage: 0,
    );

    listen = eventBus.on<BottomBack>().listen((event) {
      setState(() {
        _controller.jumpToPage(1);
        setState((){
          _currentIndex = 1;
        });
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    listen.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false : 字体随着系统的“字体大小”辅助选项来进行缩放
    ScreenUtil.instance =
    ScreenUtil(width: 750, height: 1334, allowFontScaling: false)
      ..init(context);
    return WillPopScope(
      onWillPop: () async  {
        if (lastPopTime == null ||
            DateTime.now().difference(lastPopTime!) > Duration(seconds: 1)) {
          lastPopTime = DateTime.now();

          MyToastUtils.showToastBottom("再按一次退出");
          return Future.value(false);
        } else {
          lastPopTime = DateTime.now();
          // 退出app
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              // 更新当前的索引值
              _currentIndex = index;
            });
          },
          children: const [
            HomePage(),
            CoinPage(),
            MeansPage()
          ],
        ),
        bottomNavigationBar:BottomNavigationBar(
            unselectedItemColor: MyColors.ziGry,
            backgroundColor: MyColors.c2,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            currentIndex: _currentIndex,
            onTap: (index){
              _controller.jumpToPage(index);
              setState((){
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              _bottomNavigationBarItem('首页','assets/images/menu_sy.png'),
              _bottomNavigationBarItem('买卖币','assets/images/menu_mmb.png'),
              _bottomNavigationBarItem('资产','assets/images/menu_zc.png'),
            ]
        ),
      ),
    );
  }
  /// 自定义底部信息
  _bottomNavigationBarItem(String title,String imgUrl){
      return BottomNavigationBarItem(
        label: title,
        icon: Image.asset(imgUrl,color: _defaultColor,fit: BoxFit.fill,width: 25,height: 25,),
        activeIcon: Image.asset(imgUrl,color: _activetColor , width: 25,height: 25,),
      );
  }
}
