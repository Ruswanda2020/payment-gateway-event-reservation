part of 'duitku_service.dart';

extension GetTransactionRequest on DuitkuService {
  Future<df.Response> getTransactionRequest({
    required GetTransactionRequestParams params,
    String callbackUrl = '',
  }) async {
    final signature =
        '${duitkuMerchantData.merchantCode}${params.orderId}${params.totalPayment}${duitkuMerchantData.apiKey}'
            .toMD5();

    final apiParamas = {
      'merchantCode': duitkuMerchantData.merchantCode,
      'paymentAmount': '${params.totalPayment}',
      'paymentMethod': params.paymentMethod,
      'merchantOrderId': params.orderId,
      'productDetails': params.orderDescription,
      'customerVaName': params.customerName,
      'email': params.customerEmail,
      'callbackUrl': callbackUrl,
      'returnUrl': params.retrunUrl,
      'signature': signature,
      'expiryPeriod': params.expiryPeriod,
    };

    try {
      final response = await _dio.post(
        '${duitkuEnvironment.baseUrl}/v2/inquiry',
        data: apiParamas,
      );
      return df.Response.json(body: response.data);
    } on DioException catch (e) {
      return df.Response(
        body: e.response?.data.toString(),
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }
}
