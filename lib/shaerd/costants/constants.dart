import 'package:flutter_application_1/shaerd/components/components.dart';
import 'package:flutter_application_1/shaerd/network/local/cash_helper.dart';

import '../../modules/login/login_Screen.dart';

void signout(context) {
  cashHelper.Removedata(Key: 'token').then((value) {
    if (value) {
      NavigatAndfinsh(context, ShopLoginScreen());
    }
  });
}

String token = '';
