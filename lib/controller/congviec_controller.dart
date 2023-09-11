import 'dart:ui';

import 'package:demo_getx/api.dart';
import 'package:demo_getx/model/CongViecModel.dart';
import 'package:get/get.dart';

class CongViecController extends GetxController {
  var isLoading = true.obs;
  var listCongViec = <CongViec>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var tasks = await Api.fetchData();
      if(tasks != null){
        listCongViec.value = tasks as List<CongViec>;
      }
    } finally {
      isLoading(false);
    }
  }
}