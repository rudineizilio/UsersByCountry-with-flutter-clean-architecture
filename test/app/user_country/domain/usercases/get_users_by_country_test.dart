import 'package:clean_architecture_app/app/user_country/domain/entities/user_country_entity.dart';
import 'package:clean_architecture_app/app/user_country/domain/repositories/user_country_repository.dart';
import 'package:clean_architecture_app/app/user_country/domain/usercases/get_users_by_country.dart';
import 'package:flutter_test/flutter_test.dart';

class UserCountryRepositoryMock implements UserCountryRepository {
  @override
  Future<UserCountry> getUserCountry(CredentialsParams params) async {
    return UserCountry(
      country: params.country,
      name: 'Rudinei',
    );
  }

}

void main() {
  final repositoryMock = UserCountryRepositoryMock();
  final usecase = UsersCountryUsecase(repositoryMock);

  test('Must return the country: ', () async {
    final result = usecase(
      CredentialsParams(country: 'Brasil'),
    );

    expect(() async => await result, isA<UserCountry>());
  });
}