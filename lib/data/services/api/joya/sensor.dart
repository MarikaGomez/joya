import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:joya/data/dto/sensor.dart';
import 'package:joya/data/models/sensor.dart';
import 'package:joya/data/services/api/http_service.dart';
import '../../../../common/variables.dart';

class SensorService {
  HttpService _httpService = HttpService();

  Future<List<Sensor>?> fetch() async {
    try {
      Response responseData = await _httpService.get(url: JOYA_URL + "sensors");
      if (responseData.data == null) return [];

      var sensors = (responseData.data as List)
          .map((sensor) => Sensor.fromJson(sensor))
          .toList();
      return sensors;
    } on Exception catch (err) {
      debugPrint(" error$err");

      rethrow;
    } on Error catch (error) {
      debugPrint("$error");
    }
  }

  Future<Sensor?> findOne(String id) async {
    try {
      var responseData = await _httpService.get(url: JOYA_URL + "sensors/$id");
      if (responseData == null) throw ErrorDescription("unknown sensor id");
      return Sensor.fromJson(json.decode(responseData.toString()));
    } on Exception {
      rethrow;
    } on Error catch (error) {
      debugPrint("$error");
    }
  }

  Future<Sensor?> findOneBySerialNumber(String serialNumber) async {
    try {
      var responseData = await _httpService.get(
          url: JOYA_URL + "sensors/serialnumber/$serialNumber");
      if (responseData == null) throw ErrorDescription("unknown sensor id");
      return Sensor.fromJson(json.decode(responseData.toString()));
    } on Exception {
      rethrow;
    } on Error catch (error) {
      debugPrint("$error");
    }
  }

  Future<Sensor?> createSensor(CreateSensorDTO dto) async {
    try {
      var data = {
        "location": dto.location,
        "name": dto.name,
        "plant_id": dto.plant_id
      };
      var responseData = await _httpService.put(
          url: JOYA_URL + "sensors/${dto.serial_number}", data: data);

      return Sensor.fromJson(json.decode(responseData.toString()));
    } on Exception {
      rethrow;
    } on Error catch (error) {
      debugPrint("$error");
    }
  }
}
