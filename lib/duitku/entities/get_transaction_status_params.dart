import 'package:json_annotation/json_annotation.dart';

part 'get_transaction_status_params.g.dart';

@JsonSerializable()
class GetTransactionStatusParams {
  GetTransactionStatusParams({
    required this.orderId,
  });

  factory GetTransactionStatusParams.fromJson(Map<String, dynamic> json) =>
      _$GetTransactionStatusParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GetTransactionStatusParamsToJson(this);

  final String orderId;
}
