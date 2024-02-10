import 'dart:convert';

import '../../data/model/response/my_profile_response_model.dart';

String parseJwtToken(String? token) {
  try {
    if (token == null) return "";
    if (!token.contains(".")) return "";
    final arr = token.split(".");
    if (arr.length < 2) return "";
    String foo = arr[1];
    List<int> tokenRes = base64.decode(base64.normalize(foo));
    dynamic data = jsonDecode(utf8.decode(tokenRes));
    if (data["exp"] == null) return "";
    final now = DateTime.now().millisecondsSinceEpoch / 1000;

    if (data["exp"] < now) {
      throw Exception("Token expired");
    }
    return token;
  } catch (err) {
    print("ERROR parseJwtToken $err");
    return "";
  }
}

CurrentUserData parseCurrentUserFromJwtToken(String token) {
  if (token.isEmpty) return CurrentUserData();
  final arr = token.split(".");
  if (arr.length < 2) return CurrentUserData();
  String foo = arr[1];
  List<int> tokenRes = base64.decode(base64.normalize(foo));
  return CurrentUserData.fromJson(jsonDecode(utf8.decode(tokenRes)));
}