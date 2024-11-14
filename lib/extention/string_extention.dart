import 'dart:convert';

import 'package:crypto/crypto.dart';

extension StringExtention on String {
  String toMD5() => md5.convert(utf8.encode(this)).toString();
  String toSHA256() => sha256.convert(utf8.encode(this)).toString();
}
