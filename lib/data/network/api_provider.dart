// import 'dart:convert';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../../utils/constants/app_constants.dart';
//
// class ApiProvider {
//   Future<List<BooksModel>> getAllBooks() async {
//     List<BooksModel> list = [];
//
//     Dio dio = Dio();
//
//     try {
//       Response response = await dio.get(
//         "https://crudapi.co.uk/api/v1/library",
//         options: Options(
//           headers: {
//             "Authorization": "Bearer ${AppConstants.baseToken}",
//             "Content-Type": "application/json",
//           },
//         ),
//       );
//       if (response.statusCode == 200) {
//         list = (response.data["items"] as List?)
//             ?.map((e) => BooksModel.fromJson(e))
//             .toList() ??
//             [];
//         return list;
//       }
//     } catch (error) {
//       debugPrint("Error: $error");
//     }
//     return list;
//   }
//
//   Future<String> insertBooks(BooksModel bookModels) async {
//     Dio dio = Dio();
//
//     String text = "";
//
//     try {
//       Response response = await dio.post(
//         "https://crudapi.co.uk/api/v1/library",
//         data: jsonEncode([bookModels.toJson()]),
//         options: Options(
//           headers: {
//             "Authorization": "Bearer ${AppConstants.baseToken}",
//             "Content-Type": "application/json",
//           },
//         ),
//       );
//       if (response.statusCode == 201) {
//         text = "Insert model";
//       }
//     } catch (error) {
//       debugPrint("Error: $error");
//     }
//     return text;
//   }
//
//   Future<String> deleteBooks(String uuid) async {
//     Dio dio = Dio();
//
//     String text = "";
//
//     try {
//       Response response = await dio.delete(
//         "https://crudapi.co.uk/api/v1/library",
//         data: jsonEncode([
//           {"_uuid": uuid}
//         ]),
//         options: Options(
//           headers: {
//             "Authorization": "Bearer ${AppConstants.baseToken}",
//             "Content-Type": "application/json",
//           },
//         ),
//       );
//       if (response.statusCode == 200) {
//         text = "Delete model";
//       }
//     } catch (error) {
//       debugPrint("Error: $error");
//     }
//     return text;
//   }
//
//   Future<String> updateUserInfo(BooksModel bookModels) async {
//     Dio dio = Dio();
//
//     String text = "";
//
//     try {
//       Response response = await dio.put(
//         "https://crudapi.co.uk/api/v1/library",
//         data: jsonEncode([bookModels.toJsonForUpdate()]),
//         options: Options(
//           headers: {
//             "Authorization": "Bearer ${AppConstants.baseToken}",
//             "Content-Type": "application/json"
//           },
//         ),
//       );
//       if (response.statusCode == HttpStatus.ok) {
//         text = "updated";
//         return text;
//       }
//     } catch (error) {
//       debugPrint(error.toString());
//     }
//     return text;
//   }
// }
