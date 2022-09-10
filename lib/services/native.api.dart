import 'package:flutter/services.dart';

class NativeApi {
  var platform = const MethodChannel("com.test_mottu.flutter/list");

  Future<List<String>> callListName() async {
    List<String> listReturn = [];
    List<dynamic> listNative = await platform.invokeMethod('getList');
    for (var element in listNative) {
      listReturn.add(element.toString());
    }
    return listReturn;
  }

  Future<String> addNameUser({required String name}) async {
    String listNative = await platform.invokeMethod('setName', {'name': name});
    return listNative;
  }

  Future<String> removeNameUser({required int index}) async {
    String listNative =
        await platform.invokeMethod('removeName', {'index': index});
    return listNative;
  }

  Future<String> randomNameUser() async {
    String name = await platform.invokeMethod('randomList');
    return name;
  }

  Future<String> clearList() async {
    String message = await platform.invokeMethod('clearList');
    return message;
  }
}
