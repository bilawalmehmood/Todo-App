import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:todoapp/screens/home/controllers/home_controller.dart';

class HomeBottomNevigationBar extends GetView<HomeController> {
  const HomeBottomNevigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: Colors.black87,
        currentIndex: controller.currentIndex.value,
        onTap: (int index) {
          controller.currentIndex(index);
        },
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
            icon: Container(
              height: 52,
              width: 52,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Colors.indigoAccent,
                    Colors.purple,
                  ],
                ),
              ),
              child: const Icon(Icons.add),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
              label: ''),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        selectedIconTheme: IconThemeData(color: Colors.amber[800]),
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        // onTap: _onItemTapped,
      ),
    );
  }
}
