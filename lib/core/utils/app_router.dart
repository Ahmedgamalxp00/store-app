import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/services_locator.dart';
import 'package:store_app/features/authentication/presentation/controllers/signin_cubit/signin_cubit.dart';
import 'package:store_app/features/authentication/presentation/controllers/signup_cubit/signup_cubit.dart';
import 'package:store_app/features/authentication/presentation/views/forget_password_view.dart';
import 'package:store_app/features/authentication/presentation/views/login_success_view.dart';
import 'package:store_app/features/authentication/presentation/views/otp_view.dart';
import 'package:store_app/features/authentication/presentation/views/signin_view.dart';
import 'package:store_app/features/authentication/presentation/views/signup_success.dart';
import 'package:store_app/features/authentication/presentation/views/signup_view.dart';
import 'package:store_app/features/cart/presentation/views/cart_view.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:store_app/features/home/presentation/controllers/category_cubit/category_cubit.dart';
import 'package:store_app/features/home/presentation/views/category_view.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/features/home/presentation/views/main_view.dart';
import 'package:store_app/features/product_describtion/presentation/views/detailes_view.dart';
import 'package:store_app/features/profile/presentation/views/profile_view.dart';
import 'package:store_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSignIn = '/SignIn';
  static const kSignUp = '/SignUp';
  static const kForgetPassword = '/kForgetPassword';
  static const kLoginSuccess = '/LoginSuccess';
  static const kSignupSuccess = '/SignupSuccess';
  static const kOTPview = '/OTPview';
  static const kDetailesView = '/DetailesView';
  static const kCartView = '/CartView';
  static const kProfileView = '/ProfileView';
  static const kMainView = '/MainView';
  static const kCategoryView = '/CategoryView';
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          if (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified) {
            return const MainView();
          } else {
            return const SplashView();
          }
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kSignIn,
        builder: (context, state) => BlocProvider(
          create: (context) => SigninCubit(),
          child: const SignInView(),
        ),
      ),
      GoRoute(
        path: kSignUp,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SigninCubit(),
            ),
            BlocProvider(
              create: (context) => SignupCubit(),
            ),
          ],
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kLoginSuccess,
        builder: (context, state) => const LoginSuccessView(),
      ),
      GoRoute(
        path: kSignupSuccess,
        builder: (context, state) => const SignupSuccessView(),
      ),
      GoRoute(
        path: kOTPview,
        builder: (context, state) => const OTPViev(),
      ),
      GoRoute(
        path: kDetailesView,
        builder: (context, state) =>
            DetailesView(product: state.extra as ProductModel),
      ),
      GoRoute(
        path: kCartView,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kMainView,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: kCategoryView,
        builder: (context, state) => BlocProvider(
          create: (context) => CategoryCubit(getIt.get<HomeRepoImpl>())
            ..getCategoryProduct(state.extra as String),
          child: CategoryView(category: state.extra as String),
        ),
      ),
    ],
  );
}
