import 'dart:convert';

import 'package:electrum/model/usersModel.dart';
import 'package:electrum/services/restApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class UsersProvider extends ChangeNotifier {
  RestAPI restAPI;
  List<UsersModelData> usersList = <UsersModelData>[];

  // Get Users List Fun
  getUsersFun(BuildContext context) async {
    restAPI = RestAPI(context: context);

    Response response = await restAPI.getUsersList();

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Request --- ${response.request}");
      print("Status Code -- ${response.statusCode}");
      print("Reponse Body -- ${response.body}");

      UsersModel usersModel = UsersModel.fromJson(jsonDecode(response.body));

      if (usersModel.data != null) {
        usersList = usersModel.data;
      }

      notifyListeners();
    }
  }

  // Delete User Fun
  deleteUsersFun(BuildContext context, String userID) async {
    restAPI = RestAPI(context: context);

    Response response = await restAPI.postDeleteUser(userID);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Request --- ${response.request}");
      print("Status Code -- ${response.statusCode}");
      print("Reponse Body -- ${response.body}");

      notifyListeners();
    }
  }

  // Add User Fun
  addUsersFun(BuildContext context, String name, String job) async {
    restAPI = RestAPI(context: context);

    Response response = await restAPI.postAddUser(name, job);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Request --- ${response.request}");
      print("Status Code -- ${response.statusCode}");
      print("Reponse Body -- ${response.body}");

      Navigator.pop(context);

      notifyListeners();
    }
  }
}
