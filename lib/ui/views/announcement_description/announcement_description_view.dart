import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vewin/core/models/login_response_model.dart';
import 'package:vewin/ui/common/shared/styles.dart';
import 'package:vewin/ui/common/shared/text_style_helpers.dart';

import 'announcement_description_viewmodel.dart';

class AnnouncementDescriptionView extends StackedView<AnnouncementDescriptionViewModel> {
  const AnnouncementDescriptionView(this.announcement, {Key? key}) : super(key: key);

  final Announcement announcement;

  @override
  Widget builder(
    BuildContext context,
    AnnouncementDescriptionViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: appwhite1,
        appBar: AppBar(
          title: Text(
            'Announcement',
            style: fontFamilyMedium.size26.black,
          ),
          backgroundColor: appcolororenge,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back)),
        ),
        body: ListView(
          padding: defaultPadding20,
          children: [
            Text(
              announcement.title ?? '',
              style: fontFamilyBold.size18.color2699FB,
            ),
            verticalSpacing20,
            horizontalDivider,
            verticalSpacing20,
            Text(
              announcement.description ?? '',
              style: fontFamilyRegular.size14.appChambray1,
            ),
          ],
        ));
  }

  @override
  AnnouncementDescriptionViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AnnouncementDescriptionViewModel();
}
