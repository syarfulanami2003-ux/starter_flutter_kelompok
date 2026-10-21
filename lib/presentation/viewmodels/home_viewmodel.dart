
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  String _message = 'Starter Project Flutter MVVM Berhasil!';

  String get message => _message;

  void updateMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}
