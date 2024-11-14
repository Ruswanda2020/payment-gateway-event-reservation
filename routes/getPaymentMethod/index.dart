import 'dart:io';

import 'package:code_con/airtable/settings.dart';
import 'package:code_con/duitku/entities/get_payment_method_params.dart';
import 'package:code_con/duitku/service/duitku_service.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(
      body: 'Method not allowed',
      statusCode: HttpStatus.methodNotAllowed,
    );
  }
  return DuitkuService(duitkuMerchantData: duitkuMerchanData).getPaymentMethod(
    GetPaymentMethodParams.fromJson(
      await context.request.json() as Map<String, dynamic>,
    ),
  );
}
