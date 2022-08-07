import 'package:get/get.dart';
import 'package:weather_app/HomeScreen/Controller/dio_helper.dart';
import 'package:weather_app/HomeScreen/model/HomeModel.dart';

class Home_Controller extends GetxController{
  Homemodel? homemodel;
  String Conutry='Cairo';
  changeconutry(value){
    Conutry=value;
    getdatahome();
    update();
  }
  Home_Controller(){
    getdatahome();
  }

  void getdatahome(){
    DioHelper.getData(url: 'current.json?key=3da6757b678c47fda91133307222007&q=$Conutry').then((value){
      homemodel=Homemodel.fromJson(value.data);
      update();
    }).catchError((e){
      print(e);
    });

  }

}