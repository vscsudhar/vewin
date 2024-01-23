import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/enum/dialog_type.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/core/models/profile_image_model.dart';
import 'package:vewin/services/api_service.dart';

class ProfileViewModel extends BaseViewModel with NavigationMixin {
  ProfileViewModel() {
    _profileImageUpdateRequest = ProfileImageUpdateRequest();
  }

  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();

  late ProfileImageUpdateRequest _profileImageUpdateRequest;
  // ProfileImageUpdateResponse? profileImageUpdateResponse;

  ProfileImageUpdateRequest get profileImageUpdateRequest =>
      _profileImageUpdateRequest;

  Future<void> profileImage() async {
    profileImageUpdateRequest.id = int.parse(id);
    profileImageUpdateRequest.image = fileBytes;
    final response = await runBusyFuture(
            _apiService.getProfileImage(profileImageUpdateRequest))
        .catchError((err) {
      print(err);
    });
    if (hasError) {
      showErrDialog('Failed To Update');
    }
  }

  File? _image;

  String get name => _sharedPreference.getString('name') ?? '';
  String get id => _sharedPreference.getString('id') ?? '';
  String get mobile => _sharedPreference.getString('mobile') ?? '';
  // Uint8List get photo => const Base64Decoder().convert(_sharedPreference.getString('photo') ?? '');
  String get photo => _sharedPreference.getString('photo') ?? '';
  String get updatedImage1 =>
      _sharedPreference.getString('updateProfile').toString();

  File? get image => _image;
  String? _fileBytes;
  String? get fileBytes => _fileBytes;

  bool isExpanded = false;

  Future<void> logout() async {
    _sharedPreference.clear();
    goToLogin();
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) {
      // User canceled the image picking
      return;
    }

    final Uint8List fileBytes = await pickedImage.readAsBytes();
    final imageSizeInKB = fileBytes.length / 1024; // Convert bytes to kilobytes

    if (imageSizeInKB > 1024) {
      showErrDialog('Image Size Should be less than 1MB');
    } else {
      _image = File(pickedImage.path);
      _fileBytes = base64Encode(fileBytes);
      notifyListeners();
      profileImage();
    }
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(
        variant: DialogType.error, title: "Error", description: message);
  }
}
