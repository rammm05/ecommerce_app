import 'package:ecommerce_ui/data/remote/helper/api_helper.dart';
import 'package:ecommerce_ui/domain/constants/app_urls.dart';
import 'package:ecommerce_ui/screens/user_on_boarding/bloc/user_event.dart';
import 'package:ecommerce_ui/screens/user_on_boarding/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Bloc<UserEvent, UserState>{

  ApiHelper apiHelper;

  UserBloc({required this.apiHelper}) : super(UserInitialState()){

    on<UserRegisterEvent>((event , emit) async {
      try{
        {
          var data = await apiHelper.postApi(url: AppUrls.URL_SIGN_UP, mBodyParams: {
            "name":event.name,
            "mobile_number":event.mobNo,
            "email":event.email,
            "password":event.pass
          }, isAuth: true
          );
          if(data["status"]==true){
            emit(UserSuccessState());

            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("token", data["token"]);
          } else {
            emit(UserFailureState(errMsg: data["message"]));
          }
        }
      } catch (e){
        emit(UserFailureState(errMsg: e.toString()));
      }
    });


    on<UserLoginEvent>((event , emit){
      apiHelper.getApi(url: AppUrls.URL_SIGN_UP);
    });
  }
}