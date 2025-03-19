import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/data/datasource_contract/delete_cart_datasource_contract.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/repo_contract/delete_cart_repo.dart';

class DeleteItemRepoImpl extends DeleteCartRepo {
  final DeleteDataSourceContract deleteDataSourceContract;

  DeleteItemRepoImpl({required this.deleteDataSourceContract});

  @override
  Future<Either<CartResponseEntity, String>> deleteItem(
      {required String token, required String productId}) async {
    var result = await deleteDataSourceContract.deleteItem(
      token: token,
      productId: productId,
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
