import 'package:souq/modules/social_login/social_login_screan.dart';
import 'package:souq/shared/components/components.dart';
import 'package:souq/shared/network/local/casheHelper.dart';

void SignOut(context) {
  casheHelper.removeData(key: 'token').then((value) {
    if(value){
      navigateToAndFinish(context, SocialLoginScrean());
    }
  });
}
String? uId='';