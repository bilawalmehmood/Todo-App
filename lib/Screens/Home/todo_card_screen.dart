import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/main-controller/main_controller.dart';
import 'package:todoapp/res/app_color.dart';
import 'package:todoapp/res/constants.dart';
import 'package:todoapp/screens/home/components/home_card_item.dart';
import 'package:todoapp/screens/home/controller/home_controller.dart';
import 'package:todoapp/widget/widgets.dart';

class TodoCardScreen extends StatelessWidget {
  const TodoCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final MainController mainController = Get.put(MainController());
    return SizedBox(
        width: Get.width,
        child: StreamBuilder(
            stream: Constants.stream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: circularProgress(),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      IconData icon;
                      Color iconColor;

                      Map<String, dynamic> document = snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>;

                      switch (document['catagory']) {
                        case 'Work':
                          icon = Icons.work;
                          iconColor = Colors.red;
                          break;
                        case 'Food':
                          icon = Icons.local_grocery_store_outlined;
                          iconColor = Colors.blue;
                          break;
                        case 'Workout':
                          icon = Icons.alarm;
                          iconColor = Colors.teal;
                          break;
                        case 'run':
                          icon = Icons.run_circle_outlined;
                          iconColor = Colors.green;
                          break;
                        default:
                          icon = Icons.audiotrack;
                          iconColor = Colors.yellow;
                      }
                      if (mainController.currentUser.value!.uid ==
                          document['uid']) {
                        return HomeCardItem(
                            icon: icon,
                            title: document['title'],
                            date: '12 pm',
                            iconColor: iconColor,
                            check: true,
                            iconBgColor: AppColor.textColor);
                      } else {
                        return Container();
                      }
                    }));
              }
            }));
  }
}
