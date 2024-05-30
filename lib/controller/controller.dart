
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../model/ListUserResponse.dart';
import '../view/history.dart';
import '../view/home.dart';
import '../view/profile.dart';
import 'api.dart';

class Controller extends GetxController {
  late RefreshController refreshController;
  var currentPage = 1.obs;
  late num total;
  RxList<Data> result = RxList<Data>([]);
  var loading = false.obs;

  var bottomNavIndex = 0.obs;
  // var widgetNav = <Widget>[Home(), History(), Profile()].obs;
  // RxList widgetNav = RxList([Home(), History(), Profile()]);
  // final List<Widget> widgetNav = [
  //   Home(),
  //   History(),
  //   Profile()
  // ];

  initUser() {
    result.clear();
    loading.value = true;
    Api.getListUser(1).then((value) {
      if (value.total! == 0) {
        loading.value = false;
        result.value = [];
      }
      if (value.total! > 0) {
        loading.value = false;
        result.value = value.data!;
      }
    });
  }

  void loadData() async {
    await Api.getListUser(currentPage.value).then((value) {
      total = value.total!;
    });
    try {
      if (result.length >= total) {
        refreshController.loadNoData();
      } else {
        currentPage++;
        await Api.getListUser(currentPage.value).then((value) {
          result.addAll(value.data!);
        });
        refreshController.loadComplete();
      }
    } catch (e) {
      print(e);
      refreshController.loadFailed();
    }
  }

  @override
  void onInit() {
    refreshController = RefreshController();
    initUser();
    super.onInit();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
