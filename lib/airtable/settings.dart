import 'dart:io';

import 'package:code_con/airtable/airtable_data.dart';
import 'package:code_con/duitku/entities/duitku_merchant_data.dart';

final airtableData = AirtableData(
  baseId: 'appgzzK1eHvmjs6tq',
  tableId: 'tbl28tXZ4IBrwfghn',
  token: Platform.environment['AIRTABLE_TOKEN']!,
);

final duitkuMerchanData = DuitkuMerchantData(
  merchantCode: 'DS20680',
  apiKey: Platform.environment['DUITKU_API_KEY']!,
);
