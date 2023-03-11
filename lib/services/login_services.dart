import 'dart:convert';

import 'package:http/http.dart' as http;

getLoginApi(email, password) async {
  final response = await http.post(Uri.parse('https://reqres.in/api/login'),
      body: {'email': email, 'password': password});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data['token']);
    print('Login successfully');
  } else {
    print('failed');
  }
}
