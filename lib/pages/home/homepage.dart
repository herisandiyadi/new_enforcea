import 'package:flutter/material.dart';
import 'package:new_ukm_desk/constants/cache_utils.dart';
import 'package:new_ukm_desk/constants/constants.dart';
import 'package:new_ukm_desk/constants/theme.dart';
import 'package:new_ukm_desk/pages/cart/cart_page.dart';
import 'package:new_ukm_desk/pages/home/home.dart';
import 'package:new_ukm_desk/pages/more/more_page.dart';
import 'package:new_ukm_desk/pages/widget/alert_on_back.dart';

class HomePage extends StatefulWidget {
  int tabIndex;

  HomePage({Key? key, this.tabIndex = 0}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLogin = false;
  final _loginItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: SizedBox(),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.more_horiz_outlined),
      label: 'More',
    ),
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      widget.tabIndex = index;
    });
  }

  @override
  void initState() {
    CacheUtil.getBoolean(cacheIsLogin).then((value) {
      if (value!) {
        isLogin = value;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List listPage = [const Home(), const CartPage(), const MorePage()];
    AlertOnBack alertOnBack = AlertOnBack();
    return WillPopScope(
      onWillPop: () => alertOnBack.onBackPressed(context),
      child: Scaffold(
        body: listPage[widget.tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: _loginItems,
          currentIndex: widget.tabIndex,
          selectedItemColor: purpleColor,
          unselectedItemColor: greyColor,
          onTap: _changeSelectedNavBar,
          showSelectedLabels: true,
        ),
      ),
    );
  }
}
