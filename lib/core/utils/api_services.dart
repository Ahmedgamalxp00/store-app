import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://fakestoreapi.com/';
  final Dio dio;
  ApiService(this.dio);

  Future<List<dynamic>> get({required String endpoint}) async {
    var response = await dio.get('$_baseUrl$endpoint');
    return response.data;
  }
}
