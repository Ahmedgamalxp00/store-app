import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  // GetStorage storage = GetStorage();
  // List<ProductModel> cartStoredList = GetStorage()
  //         .read<List>('cart')
  //         ?.map((e) => ProductModel.fromJson(e))
  //         .toList() ??
  //     [];

  var productMap = {};
  void manageCart(ProductModel product) {
    if (productMap.containsKey(product) &&
        productMap.keys.any(
          (element) => element.id == product.id,
        )) {
      productMap.removeWhere((key, value) => key == product);
      emit(Cartremove());
    } else {
      productMap[product] = 1;
      emit(Cartadd());
    }
  }

  void addProductToCart(ProductModel product) {
    if (productMap.containsKey(product)) {
      productMap[product] += 1;
      print(productMap.entries.map((e) => e.key.price).toList());
      emit(Cartadd());
    } else {
      productMap[product] = 1;
      print(productMap.entries.map((e) => e.key.price).toList());
      emit(Cartadd());
    }
  }

  void removeProductFromCart(ProductModel product) {
    if (productMap.containsKey(product) && productMap[product] == 1) {
      productMap.removeWhere((key, value) => key == product);
      emit(Cartremove());
    } else {
      productMap[product] -= 1;
      emit(Cartremove());
    }
  }

  String getTotal() {
    try {
      return productMap.entries
          .map((e) => e.key.price * e.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
    } catch (e) {
      return '0.00';
    }
  }

  int getCartProductNumber() {
    try {
      return productMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    } catch (e) {
      return 0;
    }
  }
}
