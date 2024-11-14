import 'package:json_annotation/json_annotation.dart';

part 'get_transaction_request_params.g.dart';

@JsonSerializable()
class GetTransactionRequestParams {
  GetTransactionRequestParams({
    required this.paymentMethod,
    required this.orderId,
    this.orderDescription = '',
    required this.customerName,
    required this.customerEmail,
    required this.retrunUrl,
    this.expiryPeriod = 15,
    required this.totalPayment,
  });

  factory GetTransactionRequestParams.fromJson(Map<String, dynamic> json) =>
      _$GetTransactionRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetTransactionRequestParamsToJson(this);

  final String paymentMethod;
  final String orderId;
  final String orderDescription;
  final String customerName;
  final String customerEmail;
  final String retrunUrl;
  final int expiryPeriod;
  final int totalPayment;
}
