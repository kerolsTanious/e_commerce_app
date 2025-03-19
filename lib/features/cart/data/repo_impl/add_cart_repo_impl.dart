import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_route/features/cart/data/datasource_contract/add_cart_datasource_contract.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/add_cart_item_entity/AddProductItemResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/entity/get_cart_entity/CartResponseEntity.dart';
import 'package:e_commerce_app_route/features/cart/domain/repo_contract/add_cart_repo.dart';

class AddCartRepoImpl extends AddCartRepo {
  final AddCartDatasourceContract addCartDatasourceContract;

  AddCartRepoImpl({required this.addCartDatasourceContract});

  @override
  Future<Either<AddProductItemResponseEntity, String>> addProduct(
      {required String token, required String productId}) async {
    var result = await addCartDatasourceContract.addProduct(
      token: token,
      productId: productId,
    );

    return result.fold(
      (response) {
        AddProductItemResponseEntity addCartResponseEntity =
            response.toAddProductItemResponseEntity();
        return Left(addCartResponseEntity);
      },
      (error) {
        return Right(error);
      },
    );
  }
}
