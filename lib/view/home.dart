import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controller/controller.dart';

class Home extends StatelessWidget {
  var controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Get List Data User",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent),
      body: Obx(() {
        return SafeArea(
          child: (controller.loading.value == true)
              ? Center(
            child: CircularProgressIndicator(),
          )
              : (controller.result.isNotEmpty)
              ? Obx(() {
            return SmartRefresher(
              controller: controller.refreshController,
              enablePullDown: false,
              enablePullUp: true,
              onLoading: controller.loadData,
              child: ListView.builder(
                  itemCount: controller.result.length,
                  itemBuilder: (context, index) {
                    final item = controller.result[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(seconds: 1),
                      child: SlideAnimation(
                          verticalOffset: 44.0,
                        child: FadeInAnimation(
                          child: ListTile(
                            title: Text("${item.firstName} ${item.lastName}"),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(item.avatar!),
                            ),
                            subtitle: Text(item.email!),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          })
              : Center(
              child: Column(
                children: [
                  Text("BELUM ADA DATA"),
                ],
              )),
        );
      }),
    );
  }
}
