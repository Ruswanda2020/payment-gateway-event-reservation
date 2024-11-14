//data airtable yang di gunakan untuk melakukan request ke api airtable
class AirtableData {
  AirtableData({
    required this.baseId,
    required this.tableId,
    required this.token,
  });

  final String baseId;
  final String tableId;
  final String token;
}
