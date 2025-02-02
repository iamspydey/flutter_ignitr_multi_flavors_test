import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetService extends GetxService {
  static InternetService get instance {
    if (!Get.isRegistered<InternetService>()) Get.put(InternetService());
    return Get.find<InternetService>();
  }

  RxBool _isConnected = RxBool(true);

  bool get isConnected => _isConnected.value;

  List<Function> _onReconnect = [];

  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  late Stream<List<ConnectivityResult>> onConnectivityChanged;

  @override
  void onInit() {
    super.onInit();

    checkConnection();
    onConnectivityChanged = Connectivity().onConnectivityChanged;

    connectivitySubscription = onConnectivityChanged
        .listen((List<ConnectivityResult> connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.none)) {
        print('No Internet Connection');
        _isConnected(false);
      } else {
        print('Internet Connected: ${connectivityResult.first.toString()}');
        _isConnected(true);
        if (_onReconnect.isNotEmpty) {
          _onReconnect.map((callback) => callback());
        }
      }
    });
  }

  void onReconnect(Function callback) {
    _onReconnect.add(callback);
  }

  /// Checks User connection state.
  void checkConnection() async {
    List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      print('No Internet Connection');
      _isConnected(false);
    } else {
      print('Internet Connected: ${connectivityResult.first.toString()}');
      _isConnected(true);
    }
  }

  @override
  void onClose() {
    connectivitySubscription.cancel();
    super.onClose();
  }
}
