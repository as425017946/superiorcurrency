import 'package:superiorcurrency/pages/coin/goumai_page.dart';
import 'package:superiorcurrency/pages/coin/goumai_shuoming_page.dart';
import 'package:superiorcurrency/pages/coin/order_page.dart';
import 'package:superiorcurrency/pages/home/add_address_page.dart';
import 'package:superiorcurrency/pages/home/address_page.dart';
import 'package:superiorcurrency/pages/home/share_page.dart';
import 'package:superiorcurrency/pages/home/shoukuan_page.dart';
import 'package:superiorcurrency/pages/home/zhuanzhang_page.dart';
import 'package:superiorcurrency/pages/means/usdt_page.dart';
import 'package:superiorcurrency/pages/mine/mine_page.dart';

import '../pages/coin/chushou_more_page.dart';
import '../pages/login/login_page.dart';

/// 静态路由
var staticRoutes = {
  'LoginPage':(context) => const LoginPage(),//登录{
  'ShoukuanPage':(context) => const ShoukuanPage(),//USDT收款
  'ZhuanzhangPage':(context) => const ZhuanzhangPage(),//USDT转账
  'AddAddressPage':(context,{type}) => const AddAddressPage(),//地址簿
  'AddressPage':(context,{type}) => AddressPage(type: type,),//添加地址
  'SharePage':(context) => const SharePage(),//分享
  'OrderPage':(context) => const OrderPage(),//订单
  'MinePage':(context) => const MinePage(),//我的页面
  'ChushouMorePage':(context) => const ChushouMorePage(),//出售方式
  'GoumaiPage':(context) => const GoumaiPage(),//确认购买
  'GoumaiShuomingPage':(context) => const GOumaiShuomingPage(),//购买数字货币限制说明
  'USDTPage':(context) => const USDTPage(),//USDT页面

  // 'ProjectMorePage':(context,{id}) => ProjectMorePage(id: id,),//项目详情
};