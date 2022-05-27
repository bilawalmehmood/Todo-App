import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/home/components/home_app_bar.dart';
import 'package:todoapp/screens/home/components/home_bottom_navigationbar.dart';
import 'package:todoapp/screens/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final MainController _mainController = Get.put(MainController());
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: homeAppBar(),
        bottomNavigationBar: const HomeBottomNevigationBar(),
        body: Obx(() => controller.screens[controller.currentIndex.value]),
      ),
    );
  }
}

//  ElevatedButton(
//               onPressed: (() => controller.logout()),
//               child: const Text('Logout'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Get.to(() => const AddTodoScreen());
//               },
//               child: const Text('Todo Screen'),
//             ),
