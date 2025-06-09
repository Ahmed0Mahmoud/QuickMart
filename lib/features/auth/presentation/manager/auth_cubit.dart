
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  SupabaseClient client = Supabase.instance.client;



  Future<void> login({required String email , required String password})async{
    try {
      emit(LoginLoading());
      await client.auth.signInWithPassword(password: password , email:  email);
      emit(LoginSuccess());
    } on AuthException catch (e) {
      emit(LoginFailure(errMessage: e.message));
    }
    catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
    }
  }

  Future<void> signup({required String name , required String email , required String password})async{
    try {
      emit(SignupLoading());
      await client.auth.signUp(password: password,email: email,);
      await addUserData(userName: name, email: email);
      emit(SignupSuccess());
    } on AuthException catch (e) {
      emit(SignupFailure(errMessage: e.message));
    }
    catch(e) {
      emit(SignupFailure(errMessage: e.toString()));
    }
  }

  GoogleSignInAccount? googleUser ;

  Future<AuthResponse> googleSignIn() async {
    
    emit(GoogleLoginLoading());

      const webClientId = '40517163643-r27l7616745lhhore7f734obanh9g48l.apps.googleusercontent.com';
      
      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: webClientId,
      );
       googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return AuthResponse();
      }
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null || idToken == null) {
        emit(GoogleLoginFailure());
        return AuthResponse();
      }
      final response = await client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      await addUserData(userName: googleUser!.displayName!, email: googleUser!.email);
      emit(GoogleLoginSuccess());
      return response;
    }

    Future<void> logout()async{
    emit(LogoutLoading());
    try {
      await client.auth.signOut();
      emit(LogoutSuccess());
    }  catch (e) {
      log(e.toString());
      emit(LogoutFailure());
    }
    }

   // upsert => add or update
  // insert => add only
    Future<void> addUserData({required String userName , required String email})async{
    emit(AddingUserDataLoading());
    try {
      await client.from('users').upsert({
        "user_id" : client.auth.currentUser!.id,
        "name" : userName,
        "email" : email
      });
      emit(AddingUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddingUserDataFailure());
    }

    }

}
