import 'package:flutter/material.dart';
import 'package:flutter_consume_api/view/history.dart';
import 'package:flutter_consume_api/view/profile.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/controller.dart';
import 'home.dart';

class Menu extends StatelessWidget {
  var controller = Get.put<Controller>(Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          body: Obx(() {
            switch (controller.bottomNavIndex.value) {
              case 0:
                return Home();
              case 1:
                return History();
              case 2:
                return Profile();
              default:
                return Home();
            }
          }),
          bottomNavigationBar:
              BottomNavigationBar(
            currentIndex: controller.bottomNavIndex.value,
            onTap: (index) {
              controller.bottomNavIndex.value = index;
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/home.svg",
                  color: controller.bottomNavIndex.value == 0
                      ? Colors.blue
                      : Colors.black38,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/Search.svg",
                  color: controller.bottomNavIndex.value == 1
                      ? Colors.blue
                      : Colors.black38,
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/Profile.svg",
                  color: controller.bottomNavIndex.value == 2
                      ? Colors.blue
                      : Colors.black38,
                ),
                label: 'Profile',
              ),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ));
    });
  }
}
