import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:store_app/features/home/data/repos/home_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.homeRepo) : super(CategoryInitial());
  final HomeRepo homeRepo;
  Future<void> getCategoryProduct(String category) async {
    emit(CategoryLoading());
    var result = await homeRepo.getCategoryProduct(category);
    result.fold((failure) {
      emit(CategoryFailure(erorrMassage: failure.erorrMassage));
    }, (products) {
      emit(CategorySuccess(products: products));
    });
  }
}
