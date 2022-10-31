import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_time_get/home/controller/home_controller.dart';
import 'package:world_time_get/selected_country/selected_country_screen.dart';
import 'package:world_time_get/theme/theme_controller.dart';

import '../../state/state.dart';

part '../widget/arrow_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController();

    return Scaffold(
      body: Obx(
        () => Column(
          children: [
            //appbar

            SizedBox(
              height: 240,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 220,
                      padding:
                          const EdgeInsets.only(top: 60, right: 40, left: 40),
                      decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              bottomRight: Radius.circular(35))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                controller.status.toString(),
                                // intTime < 12 ? goodMorning : goodDays,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.changeTheme(
                                      themeController.changeThemee());
                                },
                                child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        Theme.of(context).buttonColor,
                                    child: Icon(
                                        themeController.appThemeMode.value ==
                                                ThemeMode.light
                                            ? Icons.light_mode
                                            : Icons.dark_mode)),
                              ),
                            ],
                          ),
                          Text(
                            controller.timeParser(
                                DateTime.now().toString(), "HH : mm"),
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            controller.timeParser(
                                DateTime.now().toString(), "dd MMM EEEE"),
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextField(
                          style: Theme.of(context).textTheme.headline6,
                          controller: controller.textEditingController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black.withOpacity(0.4),
                            ),
                            hintText: controller.hintText,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onChanged: (value) =>
                              controller.searchedCountryData(value),
                        )),
                  ),
                ],
              ),
            ),

            // countries

            controller.status.value == AppStates.loaded
                ? Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: List.generate(controller.displayedData.length,
                            (index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            SelectedCountryScreen(
                                              selectedCounty: controller
                                                  .displayedData[index],
                                            ))));
                              },
                              child: ArrowCard(
                                title: controller.displayedData[index],
                              ));
                        }),
                      ),
                    ),
                  )
                : controller.status.value == AppStates.loading
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : const Center(child: Text("error")),
          ],
        ),
      ),
    );
  }
}
