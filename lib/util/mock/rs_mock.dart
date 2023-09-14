import 'package:flutter/material.dart';

class RSMock {
  final IconData icon;
  final String name;
  final String address;
  final RSType rsType;

  RSMock(
      {required this.icon,
      required this.name,
      required this.address,
      required this.rsType});
}

enum RSType { bpjs, near, partner }
