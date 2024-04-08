import 'package:flutter/material.dart';
import 'package:practidse/screens/tabs/card_screen.dart';
import '../../utils/colors/app_colors.dart';
import 'tabs/transfer_screen.dart';

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
    _screens = [
      const CardsScreen(),
      const TransferScreen(),

    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeIndex],
      backgroundColor: AppColors.c_1A72DD,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.c_1A72DD,
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        items: const [

          BottomNavigationBarItem(
              backgroundColor: AppColors.black,
              activeIcon: Icon(Icons.credit_card),
              icon: Icon(Icons.credit_card),
              label: "Cards"),
          BottomNavigationBarItem(
              backgroundColor: AppColors.black,
              activeIcon: Icon(Icons.send),
              icon: Icon(Icons.send),
              label: "Animation"),
        ],
      ),
    );
  }
}
