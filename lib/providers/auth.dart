import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:logfiresecond/providers/http_exception.dart';
import 'cla.dart';

class Data {
  final String msg;
  final bool error;

  final Object data;

  const Data({required this.msg, required this.error, required this.data});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(msg: json["msg"], error: json["error"], data: json["data"]);
  }
}

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userID;
  late Object store_response;

  Future<void> signUp(String email, String password) async {
    final url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCPJQ4Cxg0EcA_v_42sdiGb2FMHabNGrtc");

    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );

    // ignore: avoid_print
    print(json.decode(response.body));
  }

  // Future<void> Sigin(String email, String password) async {
  //   final url_login = Uri.parse(
  //       "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCPJQ4Cxg0EcA_v_42sdiGb2FMHabNGrtc");

  //   final response_login = await http.post(
  //     url_login,
  //     body: json.encode(
  //       {
  //         'email': email,
  //         'password': password,
  //         'returnSecureToken': true,
  //       },

  //     ),
  //   );
  //   // ignore: avoid_print
  //   print(json.decode(response_login.body));

  // }

  // ignore: non_constant_identifier_names
  Future<Data> SigIn(String email, String password) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    // try {
    final response = await http.post(
        Uri.parse("http://192.168.0.119/api/v1/login"),
        body: json.encode({"user": email, "pass": password}),
        headers: requestHeaders);
    final responseData = json.decode(response.body);

    print(responseData);
    // throw HttpException(responseData["msg"]);
    return Data.fromJson(jsonDecode(response.body));
    // } catch (error) {
    //   print(error.toString());
    //   // throw error;
    // }
    // final response = await http.post(
    //     Uri.parse("http://192.168.0.119/api/v1/login"),
    //     body: json.encode({"user": email, "pass": password}),
    //     headers: requestHeaders);

    // print(Data.fromJson(jsonDecode(response.body)));

    // print(response.body);
    // return Data.fromJson(jsonDecode(response.body));

    //   if (response.statusCode == 200) {
    //     // If the server did return a 200 OK response,
    //     // then parse the JSON.
    //     return Data.fromJson(jsonDecode(response.body));
    //   } else {
    //     // If the server did not return a 200 OK response,
    //     // then throw an exception.
    //     throw Exception('Failed to load album');
    //   }
  }

  // https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=[API_KEY]
  // AIzaSyCPJQ4Cxg0EcA_v_42sdiGb2FMHabNGrtc

}
