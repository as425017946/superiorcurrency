import 'package:flutter/material.dart';
import 'package:superiorcurrency/colors/my_colors.dart';
import 'package:superiorcurrency/utils/widget_utils.dart';

import '../../config/config_screen_util.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 首页使用的组件
class HomeWidget{
  ///自定义圆角背景框
  static Widget topContainer(BuildContext context) {
    return GestureDetector(
      onTap: ((){
        Navigator.pushNamed(context, 'LoginPage');
      }),
      child: Container(
        width: ConfigScreenUtil.autoWidth200,
        height: ConfigScreenUtil.autoHeight54,
        alignment: Alignment.center,
        //边框设置
        decoration: BoxDecoration(
          //背景
          color: MyColors.homeTopBg,
          //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          //设置四周边框
          border: Border.all(width: 0.5, color: MyColors.ziYellow),
        ),
        child: Row(
          children: [
            Container(
              width: ConfigScreenUtil.autoHeight54,
              height: ConfigScreenUtil.autoHeight54,
              alignment: Alignment.center,
              //边框设置
              decoration: BoxDecoration(
                //背景
                color: MyColors.homeTopBg,
                //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                //设置四周边框
                border: Border.all(width: 0.5, color: MyColors.ziYellow),
              ),
              child: WidgetUtils.showImagesFill('assets/images/m_mine.png', ConfigScreenUtil.autoHeight60, ConfigScreenUtil.autoHeight60),
            ),
            const Expanded(child: Text("")),
            Text(
              '我的',
              style: TextStyle(fontSize: ConfigScreenUtil.autoSize30, color: MyColors.ziYellow),
            ),
            const Expanded(child: Text("")),
          ],
        ),
      ),
    );
  }

  static Widget showLunBo(List<Map> imgList){
    return Container(
      height: ConfigScreenUtil.autoHeight350,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth10, ConfigScreenUtil.autoWidth30, ConfigScreenUtil.autoWidth50),
      //边框设置
      decoration: const BoxDecoration(
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius:  BorderRadius.all(Radius.circular(10.0)),
      ),
      //超出部分，可裁剪
      clipBehavior: Clip.hardEdge,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            imgList[index]["url"],
            fit: BoxFit.fill,
          );
        },
        itemCount: imgList.length,
        autoplay: true,
        loop: true,
        duration: 1000,
        autoplayDelay: 5000,// 底部分页器
        pagination: const SwiperPagination(),
      ),
    );
  }
}