import 'package:dartz/dartz.dart';
import 'package:users_by_country/app/user_country/domain/entities/user_country_entity.dart';
import 'package:users_by_country/app/user_country/domain/errors/errors.dart';
import 'package:users_by_country/app/user_country/domain/usercases/get_users_by_country.dart';

abstract class UserCountryRepository {
  Future<Either<UsersCountryException, UserCountry>> getUserCountry(CredentialsParams params);
}