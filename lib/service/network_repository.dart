import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:junohealthapp/core/component/component.dart';

Future callPostMethod(String url, Map<String, dynamic> params) async {
  return await http
      .post(
        Uri.parse(url),
        //body: utf8.encode(json.encode(params)),
        body: json.encode(params),
        headers: {
          'Content-Type': 'application/json',
          "Access-Control-Allow-Origin": "*",
          'accept': '*/*'
        },
      )
      .timeout(const Duration(seconds: 3))
      .then((http.Response response) {
        return getResponse(response);
      });
}

Future callPatchMethod(
    String url, Map<String, dynamic> body, String? token) async {
  Map<String, String> commonHeadersToken = {
    'Content-Type': 'application/json',
    'accept': '*/*',
    "Authorization":
        token != null && token.toString().isNotEmpty ? "Bearer $token" : "",
  };

  return await http
      .patch(
    Uri.parse(url),
    body: utf8.encode(json.encode(body)),
    headers: commonHeadersToken,
  )
      .then((http.Response response) {
    return getResponse(response);
  });
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

Future callPostMethodWithToken(String url, Map<String, dynamic> params) async {
  String? token = await getToken();
  Map<String, String> commonHeadersToken = {
    'Content-Type': 'application/json',
    'accept': '*/*',
    "Authorization":
        token != null && token.toString().isNotEmpty ? "Bearer $token" : "",
  };
  return await http
      .post(Uri.parse(url),
          body: utf8.encode(json.encode(params)), headers: commonHeadersToken)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callPostMethodWithToken11(
    String searchKey, Map<String, dynamic> params) async {
  //String? token = await getToken();
  String? token;
  Map<String, String> commonHeadersToken = {
    'Content-Type': 'application/json',
    'accept': '*/*',
    "Authorization":
        token != null && token.toString().isNotEmpty ? "Bearer $token" : "",
  };

  final uri = Uri.https('181.215.78.241:5000', searchKey, params);
  return await http.post(uri, headers: commonHeadersToken);
}

Future callDeleteMethod(String url, Map<String, dynamic> params) async {
  // String? token = await getToken();
  String? token;
  Map<String, String> commonHeadersToken = {
    'Content-Type': 'application/json',
    'accept': '*/*',
    "Authorization":
        token != null && token.toString().isNotEmpty ? "Bearer $token" : "",
  };
  return await http
      .delete(Uri.parse(url),
          body: utf8.encode(json.encode(params)), headers: commonHeadersToken)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callGETMethod({required String url, String? key}) async {
  //String? token = await getToken();
  String? token;
  print('=====Token${token}');
  Map<String, String> commonHeadersToken = {
    'Content-Type': 'application/json',
    'accept': '*/*',
    "Authorization":
        token != null && token.toString().isNotEmpty ? "Bearer $token" : "",
  };

  return await http
      .get(Uri.parse(url), headers: commonHeadersToken)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future callGETMethodWithQuery(String url, Map<String, dynamic> params) async {
  //String? token = await getToken();
  String? token;

  Map<String, String> commonHeadersToken = {
    'Content-Type': 'application/json',
    'accept': '*/*',
    "Authorization": token.toString().isNotEmpty ? "Bearer $token" : "",
  };
  final uri = Uri.https("181.215.78.241:5000", url, params);

  return await http
      .get(uri, headers: commonHeadersToken)
      .then((http.Response response) {
    return getResponse(response);
  });
}

Future getResponse(Response response) async {
  final int statusCode = response.statusCode;
  printWrapped("response--statusCode--${response.statusCode}");
  printWrapped("response--${response.body}");
  if (statusCode == 500 || statusCode == 502) {
    return "{\"status\":\"false\",\"message\":\"Internal server issue\"}";
  } else if (statusCode == 401) {
    final parsedJson = jsonDecode(response.body.toString());
    final message = parsedJson['message'].toString();
    return "{\"status\":\"false\",\"message\":\"$message\"}";
  } else if (statusCode == 403) {
    // final parsedJson = jsonDecode(response.body.toString());
    return "{\"status\":\"false\",\"message\":\"Internal server issue\"}";
  } else if (statusCode == 405) {
    //assolyr
    String error = "This Method not allowed.";
    printWrapped("response--$error");
    return "{\"status\":\"0\",\"message\":\"$error\"}";
  } else if (statusCode == 400) {
    final parsedJson = jsonDecode(response.body.toString());
    // final message = parsedJson['message'].toString();
    /* statusValue == false;
    errorMessage == parsedJson['message'].toString();*/
    //  print('====dddd==${response.body.toString()}');

    //  print('======status=par$status');
    return response.body;
  } else if (statusCode == 422) {
    final parsedJson = jsonDecode(response.body.toString());
    final message = parsedJson['message'].toString();
    return "{\"status\":\"false\",\"message\":\"${message.replaceAll(RegExp(r'[^\w\s]+'), '')}\"}";
  } else if (statusCode == 204) {
    final parsedJson = jsonDecode(response.body.toString());
    final message = parsedJson['message'].toString();
    return "{\"status\":\"false\",\"message\":\"${message.replaceAll(RegExp(r'[^\w\s]+'), '')}\"}";
  } else if (statusCode < 200 || statusCode > 404) {
    String error = response.headers['message'].toString();
    printWrapped("response--$error");
    return "{\"status\":\"0\",\"message\":\"$error\"}";
  }
  return response.body;
}
