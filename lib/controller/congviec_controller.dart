import 'package:demo_getx/model/CongViecModel.dart';
import 'package:dio/dio.dart';
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
    String url = "http://192.168.1.27:3000/api/congviec/list";
    Dio dio = Dio();

    var response = await dio.get(url);
    // print(response);
    // print(response.data!);
    // print(response.data!.runtimeType);
    List<dynamic> listData = response.data;
    // print(listData.length);
    if (response.statusCode == 200) {
      // final jsonMap = json.decode(response.toString());
      List<CongViec> temp =
          (listData).map((itemWord) => CongViec.fromJson(itemWord)).toList();
      print(temp.length);
      // GetTaskResponse responseV1 = GetTaskResponse.fromJson(response.data as Map<dynamic>);
      // print(responseV1.statusCode);
      // print(responseV1);
      // var results = jsonDecode(response.data.toString());
      // listCongViec.value = results.map((e) => CongViec.fromJson(e)).toList();
      // isLoading.value = false;
      // update();
      listCongViec.value = temp;
      // print(temp.toString());
      // print(listCongViec.toString());
      isLoading.value = false;
    } else {
      Get.snackbar("Error loading data!",
          "Server responsed: ${response.statusCode}:${response.statusMessage}");
    }
  }
}
