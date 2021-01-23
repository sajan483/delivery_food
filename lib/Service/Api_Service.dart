import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_app/Models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Constants/API_Urls.dart';

class ProductService {
  static Future<ProductList> fetchProduct() async {
    try {
      Response response = await http.get(APIUrls.product);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 400 ||
          response.statusCode == 424) {
        final responseJson = json.decode(response.body);
        ProductList list = ProductList.fromJson(responseJson);
        return list;
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  // static Future<ProductResponse> fetchPopularAirports() async {
  //   String token = await SharedUtils.getString(Constants.TOKEN_PREF_KEY);

  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     'Authorization': 'Bearer $token',
  //   };

  //   var body = {"SearchText": "", "Type": "P"};

  //   debugPrint("Popular Aiport API Req: " + body.toString());

  //   try {
  //     Response response = await http.post(APIUrls.fetchAirports,
  //         headers: headers, body: json.encode(body));
  //     debugPrint("Popular Aiport API  Response: " + response.body.toString());
  //     debugPrint("Popular Aiport API  Status Code : " +
  //         response.statusCode.toString());

  //     if (response.statusCode == 200 ||
  //         response.statusCode == 201 ||
  //         response.statusCode == 400 ||
  //         response.statusCode == 424) {
  //       final responseJson = json.decode(response.body);
  //       return ProductResponse.fromJson(responseJson);
  //     }
  //   } on Exception catch (e) {
  //     debugPrint(e.toString());
  //     return null;
  //   }
  //   return null;
  // }

  // static Future<ProductResponse> fetchNearByAirport(
  //     Position currentLocation) async {
  //   String token = await SharedUtils.getString(Constants.TOKEN_PREF_KEY);

  //   Map<String, String> headers = {
  //     "Content-Type": "application/json",
  //     'Authorization': 'Bearer $token',
  //   };

  //   var body = {
  //     "Navigation": {
  //       "Latitude": currentLocation.latitude,
  //       "Longitude": currentLocation.longitude
  //     }
  //   };

  //   debugPrint("Near by Aiport API Req: " + body.toString());

  //   try {
  //     Response response = await http.post(APIUrls.fetchNearestAirport,
  //         headers: headers, body: json.encode(body));
  //     debugPrint("Near by  Aiport API  Response: " + response.body.toString());
  //     debugPrint("Near by  Aiport API  Status Code : " +
  //         response.statusCode.toString());

  //     if (response.statusCode == 200 ||
  //         response.statusCode == 201 ||
  //         response.statusCode == 400 ||
  //         response.statusCode == 424) {
  //       final responseJson = json.decode(response.body);
  //       return ProductResponse.fromJson(responseJson);
  //     }
  //   } on Exception catch (e) {
  //     debugPrint(e.toString());
  //     return null;
  //   }
  //   return null;
  // }
}