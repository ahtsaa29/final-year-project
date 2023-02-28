import 'package:employeeapp/controller/company_controller.dart';
import 'package:employeeapp/view/widgets/widget_gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cc = Get.find<CompanyController>();
    return Obx(() {
      if (cc.isLoading.value == true) {
        return const Center(child: CircularProgressIndicator.adaptive());
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
          child: ListView.builder(
              itemCount: cc.companyList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WidgetGap(),
                    Center(
                      child: CircleAvatar(
                        radius: 100.0,
                        backgroundColor: Colors.purple,
                        child: (cc.companyList[index].logo == null)
                            ? Text(
                                cc.companyList[index].logo
                                    .toString()
                                    .toUpperCase(),
                                style: const TextStyle(color: Colors.white),
                                textScaleFactor: 1.2,
                              )
                            : Image.network(cc.companyList[index].logo),
                      ),
                    ),
                    const WidgetGap(),
                    const WidgetGap(),
                    const WidgetGap(),
                    Text(
                      ("${cc.companyList[index].name.capitalize}"),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const WidgetGap(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        ("Address :${cc.companyList[index].address.capitalize}"),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        ("Phone :${cc.companyList[index].phone}"),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        ("email :${cc.companyList[index].email}"),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        ("Pan no :${cc.companyList[index].panNo}"),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const WidgetGap(),
                  ],
                );
              }),
        );
      }
    });
  }
}
