import 'package:flutter/material.dart';

class RamalProvider with ChangeNotifier {
  String _nama = '';
  DateTime _tanggalLahir = DateTime.now();

  void setData(String nama, DateTime tanggal) {
    _nama = nama;
    _tanggalLahir = tanggal;
    notifyListeners();
  }

  String get nama => _nama;
  DateTime get tanggalLahir => _tanggalLahir;
}