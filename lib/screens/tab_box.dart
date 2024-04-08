import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practidse/screens/card/card_screen.dart';
import 'package:practidse/screens/transfer/transfer_screen.dart';
import 'package:practidse/utils/colors/app_colors.dart';
import 'package:practidse/utils/styles/app_text_style.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = const [CardScreen(), TransferScreen()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.c2A3256,
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 18.w,
        unselectedFontSize: 14.w,
        selectedLabelStyle: AppTextStyle.interBold.copyWith(
          color: Colors.blue,
          fontSize: 18.w,
          fontWeight: FontWeight.w900,
        ),
        unselectedLabelStyle: AppTextStyle.interBold.copyWith(
          color: Colors.white,
          fontSize: 14.w,
          fontWeight: FontWeight.w700,
        ),
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.credit_card_sharp,
              color: Colors.blue,
              size: 30.w,
            ),
            icon: Icon(
              Icons.credit_card_sharp,
              color: Colors.white,
              size: 20.w,
            ),
            label: "CARDS",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.price_change_sharp,
              color: Colors.blue,
              size: 30.w,
            ),
            icon: Icon(
              Icons.price_change_sharp,
              color: Colors.white,
              size: 20.w,
            ),
            label: "TRANSFER",
          ),
        ],
      ),
    );
  }
}
