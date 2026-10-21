
import '../models/user_model.dart';

class UserRepository {
  // Data sementara untuk starter project.
  // Nantinya diganti dengan pemanggilan API Laravel.

  Future<List<UserModel>> getUsers() async {
    return [
      UserModel(
        id: 1,
        name: 'Contoh Pengguna',
        email: 'contoh@example.com',
      ),
    ];
  }
}
