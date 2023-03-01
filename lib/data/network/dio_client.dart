import 'package:dio/dio.dart';
import 'logging.dart';


class DioClient {
  DioClient();

   static final Dio client  = Dio(
    BaseOptions(
      baseUrl: 'https://jumpq.ai/api/customer_v1',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )..interceptors.add(Logging());
/*
  Future<UserInfo?> createUser({required UserInfo userInfo}) async {
    UserInfo? retrievedUser;

    try {
      Response response = await _dio.post(
        '/users',
        data: userInfo.toJson(),
      );

      print('User created: ${response.data}');

      retrievedUser = UserInfo.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }*/



}