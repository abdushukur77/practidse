import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:practidse/data/client/api_client.dart';
import 'package:practidse/data/models/book/book_model.dart';
import '../../utils/app_constants/app_constants.dart';
import '../models/card/card_model.dart';
import '../models/card/network_response.dart';
import '../response/my_response.dart';

class ApiProvider extends ApiClient {
  Future<MyResponse> getBooks() async {
    List<BookModel> books = [];

    try {
      Response response = await dio.get(AppConstants.endPoint);
      if (response.statusCode == HttpStatus.ok) {
        books = (response.data['items'] as List?)
                ?.map(
                  (e) => BookModel.fromJson(
                    e,
                  ),
                )
                .toList() ??
            [];
        return MyResponse(
          data: books,
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

  Future<MyResponse> deleteBook(String uuid) async {
    try {
      Response response = await dio.delete(
        AppConstants.base,
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

  Future<MyResponse> addNewBook(BookModel bookModel) async {
    try {
      Response response = await dio.post(
        AppConstants.base,
        data: [
          bookModel.toJson(),
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

  Future<MyResponse> updateBook(BookModel bookModel) async {
    try {
      Response response = await dio.put(
        AppConstants.base,
        data: [
          bookModel.toJsonForUpdate(),
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

  Future<NetworkResponse> getCards() async {
    try {
      Response response = await dio.get("/api/v1/cards");
      if (response.statusCode == 200) {
        List<CardModel> cards = (response.data as List?)
            ?.map((e) => CardModel.fromJson(e))
            .toList() ??
            [];
        return NetworkResponse(data: cards);
      }
    } catch (error) {
      debugPrint("ERROR:$error");
      return NetworkResponse(errorText: error.toString());
    }
    return NetworkResponse(errorText: "OTHER ERROR");
  }
}
