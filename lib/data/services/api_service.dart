
class ApiService {
  // Alamat dasar API Laravel untuk pengembangan lokal.
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  // Kerangka awal service.
  // Integrasi HTTP akan ditambahkan pada tahap berikutnya.

  String getApiUrl(String endpoint) {
    final path = endpoint.startsWith('/')
        ? endpoint.substring(1)
        : endpoint;

    return '$baseUrl/$path';
  }
}
