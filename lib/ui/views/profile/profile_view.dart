import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';
import 'package:vewin/ui/common/ui_helpers.dart';
import 'package:vewin/ui/common/widgets/box.dart';
import 'package:vewin/ui/common/widgets/circular_progress_indicator.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: !viewModel.isBusy
            ? SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      verticalSpaceLarge,
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          viewModel.image == null
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundColor: appViking,
                                  child: ClipOval(
                                    child: Image.network(
                                      viewModel.updatedImage1,
                                      fit: BoxFit.cover,
                                      width:
                                          100, // Adjust the width and height as needed
                                      height: 100,
                                    ),
                                  ),
                                )
                              : Container(
                                  child: CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.transparent,
                                    child: ClipOval(
                                      child: Image.file(
                                        viewModel.image!,
                                        width: 140 * 2,
                                        height: 140 * 2,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                          TextButton(
                              onPressed: () {
                                viewModel.pickImage();
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Edit'),
                                  Icon(Icons.edit),
                                ],
                              )),
                        ],
                      ),
                      verticalSpacing10,
                      verticalSpacing12,
                      Text(viewModel.name,
                          style: fontFamilyBold.size20.appChambray1),
                      Text(viewModel.id,
                          style: fontFamilyMedium.size16.appChambray1),
                      Text(viewModel.mobile,
                          style: fontFamilyMedium.size16.appChambray1),
                      // Text('Area', style: fontFamilyMedium.size16.appChambray1),
                      verticalSpacing10,
                      horizontalDivider,
                      verticalSpacing10,
                      Box(
                        width: 250,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("LogOut"),
                                  content: const Text(
                                      'Are you sure to want Logout?'),
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
                        margin: defaultPadding8,
                        boxColor: appcolorFF7612,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Logout',
                              style: fontFamilyMedium.size20,
                            ),
                            const Icon(
                              Icons.arrow_circle_right_outlined,
                              size: 40,
                              color: appChambray,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(child: AnimatedCircularProgressIndicator()));
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  FullScreenImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: 'profileImage',
          child: Image.asset(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
