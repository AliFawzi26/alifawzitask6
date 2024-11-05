
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import 'check_internet.dart';
import 'status_request.dart';

class Crud {
  Future<Either<StatusRequest, String>> postData(
      String url,
      Map<String, dynamic> data,
      Map<String, String> headers,
      ) async {
    try {
      if (await CheckInternet()) {
        var response = await http.post(
          Uri.parse(url),
          body: data,
          headers: headers,
        );

        var decodeResponse = json.decode(response.body);
        print('Response: ${response.body}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          return Left(StatusRequest.success);
        } else {
          var message = decodeResponse['message'] ?? 'Unknown error occurred';
          return Right(decodeResponse);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (error) {
      print('Error: $error');
      return const Left(StatusRequest.failure);
    }
  }

  Future<Either<StatusRequest, dynamic>> getData(
      String url, Map<String, String>? headers) async {
    try {
      if (await CheckInternet()) {
        var response = await http.get(
          Uri.parse(url),
          headers: headers,
        );

        print(response);

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          print(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      print(_);
      return const Left(StatusRequest.serverFailure);
    }
  }
  Future<Either<StatusRequest, dynamic>> putData(
      String url,
      Map<String, dynamic> data,
      Map<String, String> headers) async {
    try {
      if (await CheckInternet()) {
        var response = await http.put(
          Uri.parse(url),
          body: json.encode(data), // تأكد من تحويل البيانات إلى JSON
          headers: headers,
        );

        print('Put Response: ${response.body}');

        if (response.statusCode == 200 || response.statusCode == 204) {
          return const Left(StatusRequest.success);
        } else {
          var decodeResponse = json.decode(response.body);
          return Right(decodeResponse);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (error) {
      print('Put Error: $error');
      return const Left(StatusRequest.failure);
    }
  }





  Future<Either<StatusRequest, dynamic>> deleteData(
      String url, Map<String, String> headers) async {
    try {
      if (await CheckInternet()) {
        var response = await http.delete(
          Uri.parse(url),
          headers: headers,
        );

        print('Delete Response: ${response.body}');

        if (response.statusCode == 200 || response.statusCode == 204) {
          return const Left(StatusRequest.success);
        } else {
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (error) {
      print('Delete Error: $error');
      return const Left(StatusRequest.failure);
    }
  }
}
