part of 'duitku_service.dart';

extension GetTransactionStatus on DuitkuService {
  Future<df.Response> getTransactionStatus(
    GetTransactionStatusParams params,
  ) async {
    try {
      final signature =
          '${duitkuMerchantData.merchantCode}${params.orderId}${duitkuMerchantData.apiKey}'
              .toMD5();
      final apiParamas = {
        'merchantCode': duitkuMerchantData.merchantCode,
        'merchantOrderId': params.orderId,
        'signature': signature,
      };

      final response = await _dio.post(
        '${duitkuEnvironment.baseUrl}/transactionStatus',
        options: Options(contentType: Headers.formUrlEncodedContentType),
        data: apiParamas,
      );

      return df.Response.json(body: response.data);
    } on DioException catch (e) {
      return df.Response.json(
        body: e.response?.data.toString(),
        statusCode: e.response?.statusCode ?? 500,
      );
    }
  }
}
