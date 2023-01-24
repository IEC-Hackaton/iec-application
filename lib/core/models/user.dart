import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late String username;

  @HiveField(1)
  late String password;

  @HiveField(2)
  late String phone;

  @override
  String toString() => username; // Just for print()
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 0;

  @override
  User read(BinaryReader reader) {
    return User()
      ..username = reader.read()
      ..password = reader.read()
      ..phone = reader.read();
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.username);
    writer.write(obj.password);
    writer.write(obj.phone);
  }
}
