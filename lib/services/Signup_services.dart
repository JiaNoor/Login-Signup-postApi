import 'dart:convert';

import 'package:http/http.dart' as http;

getRegApi(email, password) async {
  final response = await http.post(Uri.parse('https://reqres.in/api/register'),
      body: {'email': email, 'password': password});

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data['token']);
    print('Account created successfully');
  } else {
    print('failed');
  }
}
