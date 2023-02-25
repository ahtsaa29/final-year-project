import 'package:employeeapp/view/screens/account_page.dart';
import 'package:employeeapp/view/screens/application_page.dart';
import 'package:employeeapp/view/screens/company_page.dart';
import 'package:employeeapp/view/screens/home_page.dart';
import 'package:employeeapp/view/screens/notification_page.dart';
import 'package:employeeapp/view/screens/payroll_page.dart';
import 'package:employeeapp/view/screens/settings_page.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Employee App"),
          leading: IconButton(
            splashRadius: 20,
            splashColor: Colors.purple[200],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              );
            },
            icon: const Icon(
              Icons.account_circle,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()),
                );
              },
              icon: const Icon(
                Icons.notifications_outlined,
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          showUnselectedLabels: true,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home",
              tooltip: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money,
              ),
              label: "Payroll",
              tooltip: "Payroll",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.wysiwyg,
              ),
              label: "Application",
              tooltip: "Application",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info_outline,
              ),
              label: "Company",
              tooltip: "Company",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: "Settings",
              tooltip: "Settings",
            ),
          ],
        ),
        body: (currentIndex == 0)
            ? const HomePage()
            : (currentIndex == 1)
                ? const PayrollPage()
                : (currentIndex == 2)
                    ? const ApplicationPage()
                    : (currentIndex == 3)
                        ? const CompanyPage()
                        : const SettingsPage(),
      ),
    );
  }
}
