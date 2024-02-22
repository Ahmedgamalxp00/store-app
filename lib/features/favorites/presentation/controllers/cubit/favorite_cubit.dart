import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  GetStorage storage = GetStorage();
  List<ProductModel> storedList = GetStorage()
          .read<List>('favorite')
          ?.map((e) => ProductModel.fromJson(e))
          .toList() ??
      [];
  void mangeFavorites(ProductModel product) async {
    if (storedList.any((element) => element.id == product.id)) {
      storedList.removeWhere((item) => item.id == product.id);
      await storage.write(
          'favorite', storedList.map((e) => e.toJson()).toList());

      emit(FavoriteAdd());
    } else if (!storedList.any((element) => element.id == product.id)) {
      storedList.add(product);
      await storage.write(
          'favorite', storedList.map((e) => e.toJson()).toList());
      emit(FavoriteRemove());
    }
  }
}
