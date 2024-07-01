import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rumahsakit/models/hospital_model.dart';
import 'package:rumahsakit/models/bed_detail_model.dart';
import 'package:rumahsakit/models/hospital_map_model.dart';

class HospitalService {
  final Dio _dio = Dio();

  Future<Either<String, HospitalModel>> getHospitals({
    required String province,
    required String city,
    required String type,
  }) async {
    try {
      var response = await _dio.get(
        "https://rs-bed-covid-api.vercel.app/api/get-hospitals",
        queryParameters: {
          "provinceid": province,
          "cityid": city,
          "type": type,
        },
      );
      var result = HospitalModel.fromJson(json.decode(response.data));
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, BedDetailModel>> getBedDetails({
    required String hospitalId,
    required String type,
  }) async {
    try {
      var response = await _dio.get(
        "https://rs-bed-covid-api.vercel.app/api/get-bed-detail",
        queryParameters: {
          "hospitalid": hospitalId,
          "type": type,
        },
      );
      var result = BedDetailModel.fromJson(json.decode(response.data));
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, HospitalMapModel>> getHospitalMap({
    required String hospitalId,
  }) async {
    try {
      var response = await _dio.get(
        "https://rs-bed-covid-api.vercel.app/api/get-hospital-map",
        queryParameters: {
          "hospitalid": hospitalId,
        },
      );
      var result = HospitalMapModel.fromJson(json.decode(response.data));
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
