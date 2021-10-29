import 'package:clean_architecture_app/app/user_country/domain/entities/user_country_entity.dart';
import 'package:clean_architecture_app/app/user_country/domain/repositories/user_country_repository.dart';

abstract class IUsersCountryUsecase {
  Future<UserCountry> call(CredentialsParams params);
}

class UsersCountryUsecase implements IUsersCountryUsecase {
  final UserCountryRepository repository;

  UsersCountryUsecase(this.repository);

  @override
  Future<UserCountry> call(CredentialsParams params) async {
    if (params.country!.isEmpty) {
      
    }

    return await repository.getUserCountry(params);
  }

}

class CredentialsParams {
  final String? country;

  CredentialsParams({this.country});
}