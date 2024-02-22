import 'package:device_preview/device_preview.dart';
import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/block_observer.dart';
import 'package:store_app/core/utils/services_locator.dart';
import 'package:store_app/core/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:store_app/features/cart/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:store_app/features/favorites/presentation/controllers/cubit/favorite_cubit.dart';
import 'package:store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:store_app/features/home/presentation/controllers/all_product_cubit/all_product_cubit.dart';
import 'package:store_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObsServer();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  setupServiceLocator();
  runApp(
    const Marketo(),
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const Marketo(),
    // ),
  );
}

class Marketo extends StatelessWidget {
  const Marketo({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AllProductCubit(getIt.get<HomeRepoImpl>())..getAllProduct(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: MaterialApp.router(
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: myTheme(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
