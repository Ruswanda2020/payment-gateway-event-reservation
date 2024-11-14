import 'package:code_con/airtable/airtable_record.dart';
import 'package:code_con/airtable/airtable_services.dart';
import 'package:code_con/airtable/settings.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final requestBody = await context.request.body();
  final elements = requestBody.split('&');
  var temp = elements.where((element) => element.contains('reference')).first;
  final reference = temp.split('=')[1];

  temp = elements.where((element) => element.contains('resultCode')).first;
  final resultCode = temp.split('=')[1].trim();

  if (resultCode == '00') {
    final json = await AirtableServices(airtableData)
        .getRecordByDuitkuReference(duitkuReference: reference);

    final recordId = ((json['records'] as List).first as Map)['id'].toString();
    final record = AirtableRecord.fromJson(
      ((json['records'] as List).first as Map)['fields']
          as Map<String, dynamic>,
    );

    await AirtableServices(airtableData).updateRecord(
      fields: record.copyWith(status: 'PAID').toJson(),
      recordId: recordId,
    );
  }

  return Response();
}
