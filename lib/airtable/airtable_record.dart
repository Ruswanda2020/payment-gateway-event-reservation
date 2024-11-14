class AirtableRecord {
  AirtableRecord({
    required this.email,
    required this.name,
    required this.orderId,
    required this.duitkuReference,
    required this.status,
  });

  factory AirtableRecord.fromJson(Map<String, dynamic> json) => AirtableRecord(
        email: json['Email'] as String,
        name: json['Name'] as String,
        orderId: json['Order ID'] as String,
        duitkuReference: json['Duitku Reference'] as String,
        status: json['Status'] as String,
      );

  final String email;
  final String name;
  final String orderId;
  final String duitkuReference;
  final String status;

  Map<String, dynamic> toJson() => {
        'Email': email,
        'Name': name,
        'Order ID': orderId,
        'Duitku Reference': duitkuReference,
        'Status': status,
      };

  AirtableRecord copyWith({
    String? email,
    String? name,
    String? orderId,
    String? duitkuReference,
    String? status,
  }) {
    return AirtableRecord(
      email: email ?? this.email,
      name: name ?? this.name,
      orderId: orderId ?? this.orderId,
      duitkuReference: duitkuReference ?? this.duitkuReference,
      status: status ?? this.status,
    );
  }
}
