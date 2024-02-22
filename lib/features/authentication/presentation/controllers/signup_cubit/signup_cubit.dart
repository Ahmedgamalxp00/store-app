import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:store_app/core/constants.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  FirebaseAuth auth = FirebaseAuth.instance;
  List<String> erorrList = [];

  // sign up method
  Future<void> signUpWithEmailAndPass({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      emit(SignupLoading());
      await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      auth.currentUser!.updateDisplayName(name);
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      emit(SignupSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'email-already-in-use' &&
          !erorrList.contains(kEmailAlreadyInUse)) {
        erorrList.add(kEmailAlreadyInUse);
        emit(SignupFailure(errorMassage: kEmailAlreadyInUse));
      }
    } catch (e) {
      erorrList.add('there was an error');
      emit(SignupFailure(errorMassage: 'there was an error'));
    }
  }
}
