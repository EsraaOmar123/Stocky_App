import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/user details model/user_details.dart';
import '../../../data/repos/account repo/account_repo.dart';
part 'add_user_details_state.dart';

class AddUserDetailsCubit extends Cubit<AddUserDetailsState> {
  AddUserDetailsCubit(this.accountRepo) : super(AddUserDetailsInitial());
  final AccountRepo accountRepo;
  addUser(UserDetailsModel user) async {
    emit(AddUserDetailsLoading());
    var responce = await accountRepo.addUserDetails(user);
    responce.fold((failure) {
      emit(AddUserDetailsFailure(errorMessage: failure));
    }, (user) {
      emit(AddUserDetailsSuccess());
      log("success");
    });
  }
}
