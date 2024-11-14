import 'package:code_con/duitku/entities/duitku_merchant_data.dart';
import 'package:code_con/duitku/entities/get_payment_method_params.dart';
import 'package:code_con/duitku/entities/get_transaction_request_params.dart';
import 'package:code_con/duitku/entities/get_transaction_status_params.dart';
import 'package:code_con/extention/string_extention.dart';
import 'package:dart_frog/dart_frog.dart' as df;
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

part 'get_payment.dart';
part 'get_transaction_request.dart';
part 'get_transaction_status.dart';

enum DuitkuEnvironment {
  sandbox('https://sandbox.duitku.com/webapi/api/merchant'),
  production('https://passport.duitku.com/webapi/api/merchant');

  const DuitkuEnvironment(this.baseUrl);
  final String baseUrl;
}

class DuitkuService {
  DuitkuService({
    required this.duitkuMerchantData,
    Dio? dio,
    this.duitkuEnvironment = DuitkuEnvironment.sandbox,
  }) : _dio = dio ?? Dio();

  final Dio _dio;
  final DuitkuEnvironment duitkuEnvironment;
  final DuitkuMerchantData duitkuMerchantData;
}
