import 'package:flutter/material.dart';
import 'package:mobile_quiz_app/configs/themes/app_colors.dart';
import 'package:mobile_quiz_app/configs/themes/ui_parameters.dart';
import 'package:get/get.dart';
import 'package:mobile_quiz_app/controllers/question_paper/zoom_drawer_controller.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(primary: onSurfaceTextColor))),
          child: SafeArea(
              child: Stack(
            children: [
              Positioned(
                  //bottom: 0,
                  right: 0,
                  top: 0,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.toggleDrawer();
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    Obx(
                      () => controller.user.value == null
                          ? const SizedBox()
                          : CircleAvatar(
                              radius: 30,
                              backgroundImage: controller
                                          .user.value!.photoURL !=
                                      null
                                  ? NetworkImage(
                                      controller.user.value!.photoURL!)
                                  : AssetImage('assets/images/user2.png')
                                      as ImageProvider<
                                          Object>, // Cast to ImageProvider<Object>
                            ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() => controller.user.value == null
                        ? const SizedBox()
                        : Text(
                            controller.user.value!.email ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                              color: onSurfaceTextColor,
                            ),
                          )),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(() => controller.user.value == null
                        ? const SizedBox()
                        : Text(
                            controller.user.value!.displayName ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: onSurfaceTextColor,
                            ),
                          )),
                    const Spacer(
                      flex: 1,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: _DrawerButton(
                        icon: Icons.subject_outlined,
                        label: "Physics",
                        onPressed: () => controller.physics(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: _DrawerButton(
                        icon: Icons.subject_outlined,
                        label: "Chemistry",
                        onPressed: () => controller.chemistry(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: _DrawerButton(
                        icon: Icons.subject_sharp,
                        label: "Maths",
                        onPressed: () => controller.maths(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: _DrawerButton(
                        icon: Icons.subject,
                        label: "Biology",
                        onPressed: () => controller.biology(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: _DrawerButton(
                        icon: Icons.email,
                        label: "email",
                        onPressed: () => controller.email(),
                      ),
                    ),
                    // _DrawerButton(
                    //   icon: Icons.book_online_sharp,
                    //   label: "Recent Scores",
                    //   onPressed: () => controller.recentScores(),
                    // ),
                    const Spacer(
                      flex: 5,
                    ),
                    Row(
                      children: [
                        Positioned(
                          //bottom: 0,
                          right: 0,
                          top: 680,
                          child: _DrawerButton(
                            icon: Icons.login_outlined,
                            label: "login",
                            onPressed: () => Get.offAndToNamed("/login"),
                          ),
                        ),
                        const SizedBox(
                          width: 174,
                        ),
                        _DrawerButton(
                          icon: Icons.logout,
                          label: "logout",
                          onPressed: () => controller.signOut(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ))),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {super.key, required this.icon, required this.label, this.onPressed});

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 15,
      ),
      label: Text(label),
    );
  }
}
