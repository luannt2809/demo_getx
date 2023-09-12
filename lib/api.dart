import 'package:demo_getx/model/CongViecModel.dart';
import 'package:dio/dio.dart';

class Api {

  static Future<List<CongViec>> fetchData() async {
    List<CongViec> listCV = [];

    try {
      var response = await Dio().get("http://192.168.1.27:3000/api/congviec/list");
      if(response.statusCode == 200){
        for (var congviec in response.data){
          listCV.add(CongViec.fromJson(congviec));
        }
      } else {
        print("Error: ${response.data}");
      }
    } catch (e) {
      print("exception: $e");
    }

    return listCV.toList();
  }
}