part of 'duitku_service.dart';

extension GetPayment on DuitkuService {
  Future<df.Response> getPaymentMethod(GetPaymentMethodParams params) async {
    final formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(params.dateTime);

    final signature =
        '${duitkuMerchantData.merchantCode}${params.amount}$formattedDateTime${duitkuMerchantData.apiKey}'
            .toSHA256();

    final apiParams = {
      'merchantcode': duitkuMerchantData.merchantCode,
      'amount': '${params.amount}',
      'datetime': formattedDateTime,
      'signature': signature,
    };

    try {
      final response = await _dio.post(
        '${duitkuEnvironment.baseUrl}/paymentmethod/getpaymentmethod',
        data: apiParams,
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
