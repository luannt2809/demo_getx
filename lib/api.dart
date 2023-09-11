import 'dart:convert';

import 'package:demo_getx/model/CongViecModel.dart';
import 'package:dio/dio.dart';

class Api {

  static Future<CongViec?> fetchData() async {
    var response = await Dio().get("http://192.168.1.61:3000/api/congviec/list");
    if(response.statusCode == 200){
      return congViecFromJson(response.data.toString());
    } else {
      return null;
    }
  }
}