import 'package:dio/dio.dart';

String parseDjangoErrorMessage(DioException e) {
  final data = e.response?.data;

  if (data is Map<String, dynamic>) {
    if (data.containsKey('detail')) return data['detail'].toString();
    if (data.containsKey('non_field_errors')) {
      final errors = data['non_field_errors'];
      if (errors is List && errors.isNotEmpty) return errors.first.toString();
    }

    for (final key in data.keys) {
      final fieldErrors = data[key];
      if (fieldErrors is List && fieldErrors.isNotEmpty) {
        return '$key: ${fieldErrors.first}';
      }
    }
  }

  return 'Error desconocido. Intenta de nuevo.';
}
