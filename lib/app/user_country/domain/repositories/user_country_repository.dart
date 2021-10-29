import 'package:clean_architecture_app/app/user_country/domain/entities/user_country_entity.dart';
import 'package:clean_architecture_app/app/user_country/domain/usercases/get_users_by_country.dart';

abstract class UserCountryRepository {
  Future<UserCountry> getUserCountry(CredentialsParams params);
}