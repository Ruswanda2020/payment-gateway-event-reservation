import 'package:code_con/airtable/airtable_data.dart';
import 'package:dio/dio.dart';

class AirtableServices {
  AirtableServices(this._airtableData, {Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;
  final AirtableData _airtableData;

  Future<Map<String, dynamic>> getRecordByEmail({required String email}) async {
    try {
      final result = await _dio.get<Map<String, dynamic>>(
        'https://api.airtable.com/v0/${_airtableData.baseId}/${_airtableData.tableId}'
        '?filterByFormula=AND({Email} = "$email")',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_airtableData.token}',
          },
        ),
      );
      return result.data ?? {};
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getRecordByDuitkuReference({
    required String duitkuReference,
  }) async {
    try {
      final result = await _dio.get<Map<String, dynamic>>(
        'https://api.airtable.com/v0/${_airtableData.baseId}/${_airtableData.tableId}'
        '?filterByFormula=AND({Duitku Reference} = "$duitkuReference")',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_airtableData.token}',
          },
        ),
      );
      return result.data ?? {};
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createRecord({
    required Map<String, dynamic> fields,
  }) async {
    try {
      final result = await _dio.post<Map<String, dynamic>>(
        'https://api.airtable.com/v0/${_airtableData.baseId}/${_airtableData.tableId}',
        data: {
          'fields': fields,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_airtableData.token}',
          },
        ),
      );
      return result.data ?? {};
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateRecord({
    required Map<String, dynamic> fields,
    required String recordId,
  }) async {
    try {
      final result = await _dio.put<Map<String, dynamic>>(
        'https://api.airtable.com/v0/${_airtableData.baseId}/${_airtableData.tableId}/$recordId',
        data: {
          'fields': fields,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ${_airtableData.token}',
          },
        ),
      );
      return result.data ?? {};
    } catch (e) {
      rethrow;
    }
  }
}
