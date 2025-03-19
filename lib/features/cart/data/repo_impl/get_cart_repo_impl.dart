import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/data/datasource_contract/get_cart_datasource_contract.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/repo_contract/get_cart_repo.dart';

class GetCartRepoImpl extends GetCartRepo {

  final GetCartDataSourceContract getCartDataSourceContract;

  GetCartRepoImpl({required this.getCartDataSourceContract});

  @override
  Future<Either<CartResponseEntity, String>> getCart(
      {required String token}) async {
    var result = await getCartDataSourceContract.getCart(token: token);
    return result.fold(
          (response) {
        CartResponseEntity cartResponseEntity = response.toCartResponseEntity();
        return Left(cartResponseEntity);
      },
          (error) {
        return Right(error);
      },
    );
  }
}