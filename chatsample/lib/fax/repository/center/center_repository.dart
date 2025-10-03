import 'package:http/http.dart';
import 'dart:convert';
import './center_response_model.dart';
import 'package:flutter/foundation.dart';

class CenterRepository {
  //  Fax受信一覧取得
  Future<FaxReceiveList> getFaxReceiveList() async {
    final Uri url = Uri.parse("https://");

    try {
      Map<String, String> headers = {"Content-Type": "application/json"};
      var requestBody = "{}"; //  json_encode('{}');
      final response = await post(
        url,
        headers: headers,
        body: requestBody,  //  Body:なし　status:500 "Internal Server Error"となる
      );

      String body = response.body;
      if(response.statusCode == 200) {
        return FaxReceiveList.fromJson(json.decode(body));
      }else{
        throw Exception('Failed');
      }
    } on Exception catch (e) {
        print("CenterRespository getFaxReceiveList Exception:$e");
      throw Exception('Failed');
    } catch(e){
      print(
        "CenterRepository getFaxReceiveList unknown error:$e");
      throw Exception('Failed');
    }
  }

  //  Fax受信詳細情報取得（PDF）データ
  Future<List<int>> getFaxReceiveInfo(int receiveFaxLogId) async{
    final Uri url = Uri.parse(
      "https://dev/$receiveFaxLogId");

    try{
      Map<String, String> headers = {"Content-Type": "application/json"};

      final response = await get(
        url,
        //  headers: headers,
      );

      List<int> body = response.bodyBytes;
      if(response.statusCode == 200){
        return body;
      } else {
        throw Exception('Failed');
      }
    } on Exception catch (e) {
      print("CenterRepository getFaxReceiveList Exception:$e");
      throw Exception('Failed');
    } catch (e) {
      print(
        "CenterRepository getFaxReceiveList unknown error:$e");
      throw Exception('Failed');
    }
  }
}