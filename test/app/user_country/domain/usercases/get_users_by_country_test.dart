import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:users_by_country/app/user_country/domain/entities/user_country_entity.dart';
import 'package:users_by_country/app/user_country/domain/errors/errors.dart';
import 'package:users_by_country/app/user_country/domain/repositories/user_country_repository.dart';
import 'package:users_by_country/app/user_country/domain/usercases/get_users_by_country.dart';

class UserCountryRepositoryMock implements UserCountryRepository {
  @override
  Future<Either<UsersCountryException, UserCountry>> getUserCountry(CredentialsParams params) async {
    if (params.country!.isEmpty) {
      return Left(UsersCountryException(message: 'Repository Error'));
    }

    return Right(UserCountry(
      country: params.country,
      name: 'Rudinei',
    ));
  }

}

void main() {
  final repositoryMock = UserCountryRepositoryMock();
  final usecase = UsersCountryUsecase(repositoryMock);

  test('Deve retornar o usuário Rudinei: ', () async {
    final result = await usecase(
      CredentialsParams(
        country: 'Brasil',
      ),
    );

    expect(result.isRight(), true);
    expect(result.getOrElse(() => UserCountry(country: '', name: '')).name, 'Rudinei');
  });

  test('Deve dar erro por conta do País estar vazio', () async {
    final result = await usecase(
      CredentialsParams(
        country: '',
      )
    );

    expect(result.isLeft(), true);
  });
}