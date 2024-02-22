import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:store_app/features/home/data/repos/home_repo.dart';

part 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit(this.homeRepo) : super(AllProductInitial());
  final HomeRepo homeRepo;
  late List<ProductModel> productList;
  Future<void> getAllProduct() async {
    emit(AllProductLoading());
    var result = await homeRepo.getAllProduct();
    result.fold((failure) {
      emit(AllProductFailure(failure.erorrMassage));
    }, (products) {
      productList = products;
      emit(AllProductSuccess(products));
    });
  }

  // search product
  List<ProductModel> searchList = [];
  void addProductToSearchList({
    required String searchName,
  }) {
    searchName.toLowerCase();
    searchList = productList.where((element) {
      String title = element.title!.toLowerCase();
      String price = element.price!.toString().toLowerCase();
      return title.contains(searchName) || price.contains(searchName);
    }).toList();
    emit(AllProductSuccess(searchList));
  }
}
