import 'package:dio/dio.dart';

//import 'package:dio_cookie_manager/dio_cookie_manager.dart';
//import 'package:cookie_jar/cookie_jar.dart';

class HttpManager {
  ///根据需要 配置baseUrl
  final String _BASEURL = '';
  final int _CONNECTTIMEOUT = 5000;
  final int _RECEIVETIMEOUT = 3000;

  ///配置headers
  Map _getHeaders() {
    Map<String, dynamic> headers = new Map();
    headers['token'] = '';
    return headers;
  }

  //单例模式
  static HttpManager _instance;
  Dio _dio;
  BaseOptions _options;

  //单例模式，只创建一次实例
  static HttpManager getInstance() {
    if (null == _instance) {
      _instance = new HttpManager();
      return _instance;
    }
  }

  //构造函数
  HttpManager() {
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    _options = new BaseOptions(
//        baseUrl: _BASEURL,
        //连接时间为5秒
        connectTimeout: _CONNECTTIMEOUT,
        //响应时间为3秒
        receiveTimeout: _RECEIVETIMEOUT,
        //设置请求头
        //headers: _getHeaders(),
        //默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
        contentType: Headers.formUrlEncodedContentType,
        //表示期望以哪种格式(方式)接受响应数据。接受4种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
        responseType: ResponseType.json);
    _dio = new Dio(_options);
    //设置Cookie
    //_dio.interceptors.add(CookieManager(CookieJar()));

    //添加拦截器
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      //var token =  prefs.get("token");
      //此处在请求前配置了存储在SharedPreferences里面的token，没需要可以不加
      //options.headers.addAll({"Authorization":"Bearer $token"});
      print("在请求之前的拦截信息");
      return options;
    }, onResponse: (Response response) {
      print("在响应之前的拦截信息");
      return response;
    }, onError: (DioError e) {
      print("在错误之前的拦截信息");
      return e;
    }));
  }

  ///get请求方法
  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('getHttp response: $response');
    } on DioError catch (e) {
      print('getHttp exception: $e');
      onError(e);
    }
    return response;
  }

  ///post请求
  post(url, {params, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.post(url,
          queryParameters: params, options: options, cancelToken: cancelToken);
      print('postHttp response: $response');
    } on DioError catch (e) {
      print('postHttp exception: $e');
      onError(e);
    }
    return response;
  }

  ///post Form请求
  postForm(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await _dio.post(url,
          options: options, cancelToken: cancelToken, data: data);
      print('postHttp response: $response');
    } on DioError catch (e) {
      print('postHttp exception: $e');
      onError(e);
    }
    return response;
  }

  ///下载文件
  downLoadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await _dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        print('$count $total');
      });
      print('downLoadFile response: $response');
    } on DioError catch (e) {
      print('downLoadFile exception: $e');
      onError(e);
    }
    return response;
  }

  /// 取消请求  同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  void onError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      print("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      print("请求取消");
    } else {
      print("未知错误");
    }
  }
}
