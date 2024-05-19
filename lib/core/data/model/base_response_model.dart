import 'package:task_manager_app/core/data/model/error/error_model.dart';

class BaseResponse<T> {
  final T? data;
  final bool? success;
  final ErrorModel? error;
  final bool? unAuthorizedRequest;

  factory BaseResponse.fromJson({
    required dynamic data,
    T Function(dynamic json)? decoder,
  }) {
    return BaseResponse(
      data: decoder?.call(data ?? '{}'),
      success: (data['success']) ?? false,
      error: data['error'] != null ? ErrorModel.fromJson(data['error']) : null,
      unAuthorizedRequest: data['unAuthorizedRequest'] ?? false,
    );
  }

  @override
  String toString() {
    return 'data: $data';
  }

  BaseResponse({
    required this.data,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
  });
}

enum ListKeysPage { todos, result }

class Page<T> {
  final List<T> list;
  final int count;

  factory Page.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) listDecode,
    ListKeysPage key,
  ) {
    return Page(
      list: json[key.name] != null
          ? (json[key.name] as List).map<T>((e) => listDecode.call(e)).toList()
          : [],
      count: json['total'] ?? 0,
    );
  }

  factory Page.fromListJson(
    Map<String, dynamic> json,
    T Function(dynamic json) listDecode,
    ListKeysPage key,
  ) {
    return Page(
      list: json[key.name] != null
          ? (json[key.name] as List).map<T>((e) => listDecode.call(e)).toList()
          : [],
      count: json['total'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'data: ${list.map((e) => '${e.toString()}\n')}';
  }

  Page({
    required this.list,
    required this.count,
  });
}

class RatePage<T> {
  final List<T> list;
  final int count;
  final bool isReviewedByMe;

  factory RatePage.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic> json) listDecode,
      ListKeysPage key,
      ) {
    return RatePage(
      list: json[key.name] != null
          ? (json[key.name] as List).map<T>((e) => listDecode.call(e)).toList()
          : [],
      count: json['total'] ?? 0,
      isReviewedByMe: json['isReviewedByMe'],

    );
  }

  factory RatePage.fromListJson(
      Map<String, dynamic> json,
      T Function(dynamic json) listDecode,
      ListKeysPage key,
      ) {
    return RatePage(
      list: json[key.name] != null
          ? (json[key.name] as List).map<T>((e) => listDecode.call(e)).toList()
          : [],
      count: json['total'] ?? 0,
      isReviewedByMe: json['isReviewedByMe'],

    );
  }

  @override
  String toString() {
    return 'data: ${list.map((e) => '${e.toString()}\n')}';
  }

  RatePage({
    required this.list,
    required this.count,
    required this.isReviewedByMe,
  });
}
