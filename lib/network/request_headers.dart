
import 'package:dio/dio.dart';

import '../helpers/utils/pref_utils.dart';



class RequestHeaderInterceptor extends InterceptorsWrapper {

  final PreferenceManager _preferenceManager =  PreferenceManager();

  final Dio dio = Dio();



  Map<String, String> getAdditionalHeaders() {
    return {
    };
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  // Future<Response<dynamic>> _cloneDioErrorRequestWithAccesstoken(
  //   DioException err,
  //   String accessToken,
  // ) {
  //   err.requestOptions.headers["accesstoken"] = accessToken;
  //   //create request with new access token
  //   final opts = Options(
  //     method: err.requestOptions.method,
  //     headers: err.requestOptions.headers,
  //   );
  //   return dio.request(
  //     err.requestOptions.path,
  //     options: opts,
  //     data: err.requestOptions.data,
  //     queryParameters: err.requestOptions.queryParameters,
  //   );
  // }

  // @override
  // void onError(err, handler) async {
   
  //     super.onError(err, handler);
  // }

  Future<Map<String, String>> getCustomHeaders() async {
    var accessToken = await _preferenceManager.getAccessToken();

    var customHeaders = {
      'content-type': 'application/json',
      'accesstoken': accessToken,
      ...getAdditionalHeaders(),
    };

    return customHeaders;
  }
}
