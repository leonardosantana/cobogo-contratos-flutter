
import 'package:fcobogo_contratos/model/address.dart';

class User{

  String name;
  String password;
  String email;
  Address address;
  List<String> phones;

  User(this.name, this.password, this.email, this.address, this.phones);


}