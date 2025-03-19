import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/data/datasource_contract/update_cart_datasource_contract.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/repo_contract/update_cart_repo.dart';

class UpdateCartRepoImpl extends UpdateCartRepo {
  final UpdateDataSourceContract updateDataSourceContract;

  UpdateCartRepoImpl({required this.updateDataSourceContract});

  @override
  Future<Either<CartResponseEntity, String>> updateCart({
    required num count,
    required String productId,
    required String token,
  }) async {
    var result = await updateDataSourceContract.updateCart(
      count: count,
      productId: productId,
      token: token,
    );
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
