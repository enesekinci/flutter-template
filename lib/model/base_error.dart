import 'package:flutter/material.dart';

class BaseError {
  final String status;
  final String statusCode;
  final String message;

  BaseError({
    this.status,
    this.statusCode,
    @required this.message,
  });
}
