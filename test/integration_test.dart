// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagramfinder/Services/api_service.dart';
import 'package:instagramfinder/Services/requests.dart';
import 'package:instagramfinder/locator.dart';

import 'package:instagramfinder/main.dart';

void main() {
  setUpLocator();
   test('get_api_test_', ()async {
     ////a simple api test
     ///I could create a mock server but it would take some more time 
    NonCachableRequest request = locator<NonCachableRequest>();
    ApiService _api =new  Api(request);
    Response res =  await _api.getInstagramUser("seddiqiwali");
    expect(res.statusCode, 200);
  });

}




