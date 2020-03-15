import 'package:dio/dio.dart';
import 'NetworkingConfig.dart';

class NetworkingManager{
  static BaseOptions baseOption = BaseOptions(baseUrl: NetworkingConfig.baseURL,connectTimeout: NetworkingConfig.timeout);
  static Dio dio = Dio(baseOption);

static Future  request(String url,{Map<String,dynamic> params, String methond = 'get',Interceptor inter}) async{
    //个性配置 网络请求方式
    final Options option = Options(method: methond);

    //创建一个全局拦截
    Interceptor baseInter = InterceptorsWrapper(
      onRequest: (res){
        print('请求拦截');
      },
      onResponse: (resp){
        print('响应拦截');
      },
      onError: (error){
        print('错误拦截');
      }
    );
    List<Interceptor> allInter = [baseInter];
    if(inter != null){
      //添加个性拦截器
       allInter.add(inter);
    }
    //将所有的拦截器添加到拦截器中
    dio.interceptors.addAll(allInter);
    try{
      //配置网络请求，并发送网络请求
      Response resp = await dio.request(
        url,
        queryParameters: params,
        options: option,
      );
      return resp.data;
    } on DioError catch(e){
      //将捕获的异常抛出
      return Future.error(e);
    }
  }

  postRequest(String url){
    Dio d = Dio();
    d.post(url).then((Response res){
      print('Get Request:\n $res.data');
    });
  }

  getRequest(String url){
    Dio d = Dio();
    d.get(url).then((Response res){
      print('Post Request:\n $res.data');
    });
  }

}
