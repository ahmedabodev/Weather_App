import 'package:get/get.dart';
import 'package:weather_app/HomeScreen/Controller/dio_helper.dart';
import 'package:weather_app/HomeScreen/model/HomeModel.dart';
import 'package:weather_app/HomeScreen/model/home7daymodel.dart';

class Home_Controller_7days extends GetxController{
  home7daymodel? homemodel;
  String Conutry='Cairo';
  changeconutry(value){
    Conutry=value;
    getdatahome();
    update();
  }
  Home_Controller_7days(){
    getdatahome();
  }
  void getdatahome(){
    DioHelper.getData(url: 'forecast.json?key=3da6757b678c47fda91133307222007&q=$Conutry&days=7').then((value){
      homemodel=home7daymodel.fromJson(value.data);
      print(value.data);
      print(homemodel);
      update();
    }).catchError((e){
      print(e);
    });

  }

}