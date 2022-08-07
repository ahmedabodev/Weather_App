import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widget/Compont.dart';
import 'package:weather_app/HomeScreen/Controller/Home_Controller.dart';
import 'package:weather_app/widget/custom_text_form_field.dart';

import '../Controller/Home_Controller_7days.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final Home_Controller home_controller = Get.put(Home_Controller());
  final Home_Controller_7days home_controller_7days = Get.put(Home_Controller_7days());
  String date = DateFormat.yMMMMd('en_US').format(DateTime.now());
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    home_controller_7days.getdatahome();
    return Scaffold(
      backgroundColor: const Color(0xff050505),
      body: SafeArea(
        child: SingleChildScrollView(
          child: weatherhome(context),
        ),
      ),
    );
  }
  weatherhome(context){
    double sizeheight =MediaQuery.of(context).size.height/2;

    return Column(
      children: [
        const SizedBox(height: 15),
        GetBuilder<Home_Controller>(
          builder: (controller) {
            if ((controller.homemodel != null)) {

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomText(
                      text: date,
                      size: 20,
                      weight: FontWeight.bold,
                      Align: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Wrap(
                      children: [
                        const Icon(
                          Icons.location_on_sharp,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: controller.homemodel!.Location!.name,
                          size: 20,
                          weight: FontWeight.bold,
                          Align: TextAlign.center,
                        ),
                        const CustomText(
                          text: ',',
                          size: 18,
                          weight: FontWeight.normal,
                          Align: TextAlign.center,
                        ),
                        CustomTextgrey(
                          text: controller.homemodel!.Location!.country,
                          size: 16,
                          weight: FontWeight.w400,
                          Align: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: custom_text_form_field(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 30,
                      ),
                      controller: searchcontroller,
                      onchange: (value) {
                        home_controller.changeconutry(value);
                        home_controller_7days.changeconutry(value);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/map.png'),
                            fit: BoxFit.contain)),
                    child: Column(
                      children: [
                        Center(
                            child: Image.network(
                              'https:${controller
                                  .homemodel!.Current!.condition!.icon}',
                              height: 200,
                              fit: BoxFit.contain,
                            )),
                        Center(
                            child: CustomText(
                              text: controller
                                  .homemodel!.Current!.condition!.text,
                              size: 40,
                              weight: FontWeight.bold,
                              Align: TextAlign.center,
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: CustomText(
                              text: '${controller.homemodel!.Current!.temp_c
                                  .toInt()}°',
                              size: 50,
                              weight: FontWeight.bold,
                              Align: TextAlign.center,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Card(
                      elevation: 10,
                      color: const Color(0xff18191e),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                const CustomTextgrey(
                                  text: "wind_kph",
                                  size: 16,
                                  weight: FontWeight.w400,
                                  Align: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  text: '${controller
                                      .homemodel!.Current!.wind_kph
                                      .toInt()}%',
                                  size: 20,
                                  weight: FontWeight.bold,
                                  Align: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0),
                              child: VerticalDivider(
                                color: Colors.white,
                                thickness: 2,
                              ),
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                const  CustomTextgrey(
                                  text: "humidity",
                                  size: 16,
                                  weight: FontWeight.w400,
                                  Align: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  text: '${controller
                                      .homemodel!.Current!.humidity}%',
                                  size: 20,
                                  weight: FontWeight.bold,
                                  Align: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  daysweather(context),
                  const SizedBox(height: 10,),

                ],
              );
            } else {
              return Column(
                children:  [
                  SizedBox(height: sizeheight),
                 const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
  daysweather(context) {
    return GetBuilder<Home_Controller_7days>(
      builder: (controller1) {
        return (controller1.homemodel != null)
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 10,
              // color: Color(0xff18191e),
              color: Colors.transparent,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller1.homemodel!.Forecast!.forecat.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = controller1.homemodel!.Forecast!.forecat;
                  String date1 = DateFormat.yMMMMd()
                      .format(DateTime.parse(item[index].date));
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 10,
                      color: const Color(0xff18191e),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: CustomText(
                                  text: date1,
                                  size: 18,
                                  weight: FontWeight.bold,
                                  Align: TextAlign.center,
                                )),
                            Image.network('https:' +
                                item[index].Day!.condition!.icon),
                            Center(
                                child: CustomText(
                                  text: item[index].Day!.condition!.text,
                                  size: 18,
                                  weight: FontWeight.bold,
                                  Align: TextAlign.center,
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                                child: CustomText(
                                  text: '${item[index]
                                      .Day!
                                      .avgtemp_c
                                      .toInt()}°',
                                  size: 18,
                                  weight: FontWeight.bold,
                                  Align: TextAlign.center,
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        )
            : const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

}

