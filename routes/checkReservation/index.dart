import 'dart:io';

import 'package:code_con/airtable/airtable_services.dart';
import 'package:code_con/airtable/settings.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dio/dio.dart' as dio;

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response(
      body: 'Method not allowed',
      statusCode: HttpStatus.methodNotAllowed,
    );
  }

  try {
    final email =
        (await context.request.json() as Map<String, dynamic>)['email']
            .toString();
    final response =
        await AirtableServices(airtableData).getRecordByEmail(email: email);
    final records = response['records'] as List;
    if (records.isNotEmpty) {
      return Response.json(
        body: {
          'data': (records.first as Map<String, dynamic>)['fields'],
        },
      );
    } else {
      return Response(
        body: 'email not found',
        statusCode: HttpStatus.notFound,
      );
    }
  } on dio.DioException catch (e) {
    return Response(
      body: e.response?.data.toString(),
      statusCode: e.response?.statusCode ?? 500,
    );
  }
}
