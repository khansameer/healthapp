import 'network_repository.dart';

class ApiService {
  Future<String> callPostMethodApi(
      {required Map<String, dynamic> body, required String url}) async {
    var response = await callPostMethod(url, body);
    print('======$url');
    return response;
  }

  Future<String> callPostMethodApiWithToken(
      {required Map<String, dynamic> body, required String url}) async {
    var response = await callPostMethodWithToken(url, body);
    print('======$url');
    return response;
  }

  Future<String> callPatchMethods(
      {required Map<String, dynamic> body,
      required String url,
      String? token}) async {
    var response = await callPatchMethod(url, body, token);
    return response;
  }

  Future<String> callGetMethod({required String url, String? key}) async {
    var response = await callGETMethod(url: url, key: key);
    return response;
  }
}
