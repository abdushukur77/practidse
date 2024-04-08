import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:practidse/data/client/api_client.dart';
import '../../utils/app_constants/app_constants.dart';
import '../models/card/card_model.dart';
import '../response/my_response.dart';

class ApiProvider extends ApiClient {
  Future<MyResponse> getCards() async {
    List<CardModel> cards = [];

    try {
      Response response = await dio.get(AppConstants.endPoint);
      if (response.statusCode == HttpStatus.ok) {
        cards = (response.data['items'] as List?)
                ?.map(
                  (e) => CardModel.fromJson(
                    e,
                  ),
                )
                .toList() ??
            [];
        return MyResponse(
          data: cards,
        );
      }
    } catch (error) {
      MyResponse(
        errorText: error.toString(),
      );
      debugPrint("ERROR:$error");
    }
    return MyResponse(
      errorText: "NO'MALUM XATOLIK!!!",
    );
  }

  Future<MyResponse> deleteCard(String uuid) async {
    try {
      Response response = await dio.delete(
        AppConstants.endPoint,
        queryParameters: {},
        data: [
          {"_uuid": uuid}
        ],
      );
      return MyResponse(
        data: response.statusCode.toString(),
      );
    } catch (error) {
      debugPrint("ERROR:$error");
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }

  Future<MyResponse> addNewCard(CardModel cardModel) async {
    try {
      Response response = await dio.post(
        AppConstants.endPoint,
        data: [
          cardModel.toJson(),
        ],
      );
      return MyResponse(
        data: response.statusCode.toString(),
      );
    } catch (error) {
      debugPrint("ERROR:$error");
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }

  Future<MyResponse> updateCard(CardModel cardModel) async {
    try {
      Response response = await dio.put(
        AppConstants.endPoint,
        data: [
          cardModel.toJsonForUpdate(),
        ],
      );
      return MyResponse(
        data: response.statusCode.toString(),
      );
    } catch (error) {
      debugPrint("ERROR:$error");
      return MyResponse(
        errorText: error.toString(),
      );
    }
  }
}
