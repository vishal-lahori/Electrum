import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RestAPI {
  BuildContext _context;
  RestAPI({context}) {
    _context = context;
  }

// Users List URL
  Future<Response> getUsersList() async {
    Response response = await get("https://reqres.in/api/users?page=2");

    return response;
  }

// Add User URL
  Future<Response> postAddUser(String name, String job) async {
    Response response = await post("https://reqres.in/api/users",
        body: {"name": name, "job": job});

    return response;
  }

  // Delete User URL
  Future<Response> postDeleteUser(String userID) async {
    Response response =
        await post("https://reqres.in/api/users/2", body: {"user-id": userID});

    return response;
  }
}
