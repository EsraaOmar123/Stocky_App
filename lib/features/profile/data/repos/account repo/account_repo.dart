import 'package:dartz/dartz.dart';

import '../../models/user details model/user_details.dart';

abstract class AccountRepo {
  Future<Either<String, void>> addUserDetails(UserDetailsModel user);
  Either<String, UserDetailsModel> fetchUserDetails(String userId);
  Future<Either<String, void>> updateUserDetails(
      UserDetailsModel user, String userId);
}
