import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rumahsakit/models/city_model.dart';
import 'package:rumahsakit/models/province_model.dart';

class ProvinceService {
  final Dio _dio = Dio();

  Future<Either<String, ProvinceModel>> getProvinces() async {
    try {
      var response = await _dio.get(
        "https://rs-bed-covid-api.vercel.app/api/get-provinces",
      );
      var result = ProvinceModel.fromJson(json.decode(response.data));
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CityModel>> getCities({
    required String province,
  }) async {
    try {
      var response = await _dio.get(
        "https://rs-bed-covid-api.vercel.app/api/get-cities",
        queryParameters: {
          "provinceid": province,
        },
      );
      var result = CityModel.fromJson(json.decode(response.data));
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
