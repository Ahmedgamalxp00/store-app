import 'package:dartz/dartz.dart';
import 'package:store_app/core/erorrs/failures.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProduct();
  Future<Either<Failure, List<ProductModel>>> getCategoryProduct(
    String category,
  );
}
