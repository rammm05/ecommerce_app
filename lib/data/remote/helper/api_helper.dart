import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_ui/data/remote/helper/app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper {


  Future<dynamic> getApi({required String url}) async {
    var uri = Uri.parse(url);

    try{
      var res = await http.get(uri);
      return returnJsonResponse(res);

    } on SocketException catch (e){
      throw NoInternetException(msg: e.toString());
    }
    catch (e){
      throw FetchDataException(msg: e.toString());
    }

  }


  Future<dynamic> postApi({
    required String url,
    Map<String, dynamic>? mBodyParams,
    Map<String, String>? mHeaders,
    bool isAuth = false
  }) async {
    var uri = Uri.parse(url);

    try{

      if(!isAuth){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var token = prefs.getString("token") ?? "";

        mHeaders ??= {};
        mHeaders["Authorization"] = "Bearer $token";
      }

      var res = await http.post(uri, body: mBodyParams != null
          ? jsonEncode(mBodyParams) : null,
        headers: mHeaders
      );
      return returnJsonResponse(res);

    } on SocketException catch (e){
      throw NoInternetException(msg: e.toString());
    }
    catch (e){
      throw FetchDataException(msg: e.toString());
    }

  }

  dynamic returnJsonResponse(http.Response response){
    switch(response.statusCode){
      case 200:{
          var mData = jsonDecode(response.body);
          return mData;
      }
      case 400:{
        var mData = jsonDecode(response.body);
        throw BadRequestException(msg: mData["message"]);
      }
      case 401:
      case 403:{
        var mData = jsonDecode(response.body);
        throw UnauthorizedException(msg: mData["message"]);
      }
      case 500:
      case 502:{
        var mData = jsonDecode(response.body);
        throw ServerException(msg: mData["message"]);
      }
      default:
        throw FetchDataException(msg: response.body.toString());

    }


  }

}