import 'dart:async';

class FLRUtils {
  Timer? _timer;
  int _countDownNumber = 60;
  int get countDownNumber => _countDownNumber;
  bool _isTimerDone = false;
  bool get isTimerDone => _isTimerDone;
  void startCountDown(Function(int count) onLoop) {
    cancelTime();
    _countDownNumber = 60;
    print("start...");
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countDownNumber == 1) {
        timer.cancel();
        _isTimerDone = true;
      } else {
        _isTimerDone = false;

        _countDownNumber--;
      }
      onLoop(countDownNumber);
      print("countDownNumber=$countDownNumber");
    });
  }

  void cancelTime() {
    _timer?.cancel();
  }
}
