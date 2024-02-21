import 'package:flutter/material.dart';
import 'package:food_delivery/presentation/screens/home/home_screen.dart';
import 'package:food_delivery/presentation/screens/profile/profile_screen.dart';

import '../order/order_screen.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {

  PageController pageController = PageController();
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          OrderScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTabIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green.shade700,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Khám phá'),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long), label: 'Đơn hàng'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: 'Cá nhân'),
          ],
          onTap: (index) {
            setState(() {
              currentTabIndex = index;
              pageController.jumpToPage(index);
            });
          }),
    );
  }
}
