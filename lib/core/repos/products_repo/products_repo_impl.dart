import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/constants/endpoints.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub/core/services/data_service.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService _dataService;

  ProductsRepoImpl({required this._dataService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      final data =
          await _dataService.getData(
                path: BackendEndpoints.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get best selling products'));
    }
  }
  
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async{
    try {
      final data =await  _dataService.getData(
        path: BackendEndpoints.getProducts,
      ) as List<Map<String, dynamic>>;
      List<ProductEntity> products = data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products'));
    }
  }
}
