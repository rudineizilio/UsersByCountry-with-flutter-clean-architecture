import 'package:dartz/dartz.dart';
import 'package:users_by_country/app/user_country/domain/entities/user_country_entity.dart';
import 'package:users_by_country/app/user_country/domain/errors/errors.dart';
import 'package:users_by_country/app/user_country/domain/repositories/user_country_repository.dart';

abstract class IUsersCountryUsecase {
  Future<Either<UsersCountryException, UserCountry>> call(CredentialsParams params);
}

class UsersCountryUsecase implements IUsersCountryUsecase {
  final UserCountryRepository repository;

  UsersCountryUsecase(this.repository);

  @override
  Future<Either<UsersCountryException, UserCountry>> call(CredentialsParams params) async {
    if (params.country!.isEmpty) {
      return Left(UsersCountryException(message: 'Você prcisa informar um país'));
    }

    return await repository.getUserCountry(params);
  }

}

class CredentialsParams {
  final String? country;

  CredentialsParams({this.country});
}