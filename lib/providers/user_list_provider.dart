import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user_model.dart';
import '../network/user_network.dart';

final userListProvider =
    StateNotifierProvider<UserListNotifier, AsyncValue<List<UserModel>>>((ref) {
  return UserListNotifier(ref);
});

class UserListNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  final Ref ref;

  UserListNotifier(this.ref) : super(const AsyncValue.loading());

  getData() async {
    try {

      List<UserModel> userModel = await UserNetwork().userListData();
      state = AsyncValue.data(userModel);
    } catch (e) {
      return state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
