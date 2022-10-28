import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_time_get/selected_country/controller/selected_county_controller.dart';
import 'package:world_time_get/state/state.dart';

class SelectedCountrView extends GetView<SelectedCountryController> {
  const SelectedCountrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(controller.title, context),
        body: Obx((() => controller.status.value == AppStates.loaded
            ? Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(context).highlightColor,
                            border: Border.all(
                                color: Theme.of(context).hoverColor, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            //   state.response!.datetime.toString().substring(11, 13),
                            controller.data.value!.datetime
                                .toString()
                                .substring(11, 13),
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 65, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: 25,
                          child: Text(":",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(fontWeight: FontWeight.w800)),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(context).highlightColor,
                            border: Border.all(
                                color: Theme.of(context).hoverColor, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            //   state.response!.datetime.toString().substring(14, 16),
                            controller.data.value!.datetime
                                .toString()
                                .substring(14, 16),
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 65, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      //   state.response!.timezone.toString().split("/")[1],
                      controller.data.value!.timezone.toString().split("/")[1],
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      //////    state.response!.timezone.toString().split("/")[0],
                      controller.data.value!.timezone.toString().split("/")[0],
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          //  "${timeParser(state.response!.datetime.toString(), "EEEE")}, GMT ${state.response!.utcOffset}",
                          "${controller.timeParser(controller.data.value!.datetime.toString(), "EEEE")}, GMT ${controller.data.value!.utcOffset}",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          //  timeParser(
                          //    state.response!.datetime.toString(), "MMM dd, yyyy"),
                          controller.timeParser(
                              controller.data.value!.datetime.toString(),
                              "MMM dd, yyyy"),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              ))));
  }

  PreferredSize appBarWidget(String title, BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: AppBar(
        leading: Transform(
          transform: Matrix4.translationValues(20.0, 20.0, 20.0),
          child: IconButton(
            enableFeedback: false,
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).buttonColor,
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        centerTitle: true,
        titleSpacing: 0.0,
        title: Transform(
          // you can forcefully translate values left side using Transform
          transform: Matrix4.translationValues(-20.0, 20.0, 0.0),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
