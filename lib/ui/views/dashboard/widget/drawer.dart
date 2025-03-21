import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/views/dashboard/dashboard_viewmodel.dart';

class DrawerView extends StackedView<DashboardViewModel> {
  const DrawerView({super.key});

  static final GlobalKey<AnimatedListState> listKey =
      GlobalKey<AnimatedListState>();

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return Drawer(
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          buildHeader(context, viewModel.photo, viewModel.name, viewModel.id,
              viewModel.updateImage1),
          buildMenuItems(context, viewModel),
        ]),
      ),
    );
  }

  Widget buildHeader(
    BuildContext context,
    String photo,
    String name,
    String id,
    String updateImage1,
  ) =>
      Container(
        color: appcolororenge,
        padding: defaultPadding20,
        child: Column(children: [
          photo == null
              ? CircleAvatar(
                  radius: 50,
                  backgroundColor: appViking,
                  child: ClipOval(
                    child: Image.network(
                      photo,
                      fit: BoxFit.cover,
                      width: 100, // Adjust the width and height as needed
                      height: 100,
                    ),
                  ),
                )
              : Container(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: Image.network(
                        updateImage1,
                        width: 140 * 2,
                        height: 140 * 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
          verticalSpacing10,
          Text(name, style: fontFamilyBold.size18.appwhite),
          Text(id, style: fontFamilyBold.size16.white54)
        ]),
      );

  Widget buildMenuItems(BuildContext context, DashboardViewModel viewModel) =>
      Column(
        children: [
          ListTile(
              leading: Image.asset(
                'assets/gif/dashboard.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                "Dash Board",
                style: fontFamilyBold.size16,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              leading: Image.asset(
                'assets/gif/walking.gif',
                height: 50,
                width: 50,
              ),
              title: Text(
                "Profile",
                style: fontFamilyBold.size16,
              ),
              onTap: () {
                viewModel.goToProfile();
              }),
          ListTile(
              leading: Image.asset(
                'assets/gif/lockgif.gif',
                height: 70,
                width: 50,
              ),
              title: Text(
                "Change Password",
                style: fontFamilyBold.size16,
              ),
              onTap: () {
                viewModel.goToChangePassword();
              }),
          ListTile(
            leading: Image.asset(
              'assets/gif/logout.gif',
              height: 50,
              width: 50,
            ),
            title: Text(
              "Logout",
              style: fontFamilyBold.size16,
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("LogOut"),
                      content: const Text('Are you sure to want Logout?'),
                      actions: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(
                            'assets/gif/close.gif',
                            height: 30,
                            width: 30,
                          ),
                        ),
                        verticalSpacing12,
                        InkWell(
                          onTap: () => viewModel.logout(),
                          child: Image.asset(
                            'assets/gif/done.gif',
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      );

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}
