import 'dart:async';

import 'package:flutter/cupertino.dart';

class Deboucer {
  final int millisecond;
  late VoidCallback action;
  Timer? _timer;

  Deboucer({required this.millisecond});
  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(microseconds: millisecond), action);
  }
}
