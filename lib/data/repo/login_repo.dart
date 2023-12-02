
import '../service/login_service.dart';

class LoginRepo {
  Future<String> getToken(email, token) async {
    var res = await LoginService().getToken(email: email, token: token);

    if (res.isEmpty) {
      return 'Unable to login';
    } else {
      return res;
    }
  }
}
