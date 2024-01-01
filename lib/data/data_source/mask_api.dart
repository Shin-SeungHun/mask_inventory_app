import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../dto/mask_dto.dart';

class MaskApi {
  Future<MaskDto> getMaskResult() async {
    try {
      final response = await http.get(Uri.parse(
          'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json'));

      if (response.statusCode == 200) {
        return MaskDto.fromJson(jsonDecode(response.body));
      } else {
        if (kDebugMode) {
          print('Failed to fetch data: ${response.statusCode}');
        }
        return MaskDto();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
      return MaskDto();
    }
  }
}
