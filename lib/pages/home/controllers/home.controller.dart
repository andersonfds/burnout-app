import 'package:app/core/models/activity/activity.model.dart';
import 'package:app/core/models/auth.model.dart';
import 'package:app/shared/mixins/messaging_channel.mixin.dart';
import 'package:app/shared/services/iactivity.service.dart';
import 'package:app/shared/services/iauth.service.dart';
import 'package:app/shared/services/iuser.service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController
    with StateMixin<List<ActivityModel>?>, MessagingChannel {
  // constants
  static const moneyValueChanged = 'MONEY_VALUE_CHANGED';
  static const homeShouldRefresh = 'HOME_SHOULD_REFRESH';

  // services
  IActivityService _activityService = Get.find();
  IAuthService _authService = Get.find();
  IUserService _userService = Get.find();
  GetStorage _box = Get.find();

  // observables
  Rx<AuthModel?> user = Rx(null);
  Rx<ActivityModel?> selected = Rx(null);
  Rx<int?> coins = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadBalance();
    change(null, status: RxStatus.error());
    getCurrentUser();
    setKeys([moneyValueChanged, homeShouldRefresh]);
    startListening();
  }

  getCurrentUser() {
    user.value = _authService.getCurrentUser();
    user.refresh();
  }

  loadBalance() {
    coins.value = _box.read<int?>('balance') ?? 0;
    _userService.getBalance().then((value) {
      if (value != null) {
        _box.write('balance', value);
        coins.value = value;
      }
    });
  }

  loadActivities() {
    change(null, status: RxStatus.loading());
    _activityService.getAll().then((value) {
      if (value?.isNotEmpty == true)
        change(value, status: RxStatus.success());
      else
        change(null, status: RxStatus.empty());
    }).catchError((e) {
      change(null, status: RxStatus.error());
    });
  }

  onActivityTap() {
    final activity = selected.value;
    if (activity?.unlocked == true) {
      _activityService.startActivity(activity?.id);
    }
  }

  updateMoney(String value) {
    coins.value = int.tryParse(value);
  }

  @override
  onMessage(String channel, dynamic data) {
    switch (channel) {
      case moneyValueChanged:
        return updateMoney(data.toString());
      case homeShouldRefresh:
        return loadActivities();
    }
  }
}
