import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/mixins/navigation_mixin.dart';
import 'package:vewin/services/api_service.dart';

class ProfileViewModel extends BaseViewModel with NavigationMixin {
  ProfileViewModel();

  final _apiService = ApiService.init();
  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();

  File? _image;

  String get name => _sharedPreference.getString('name') ?? '';
  String get id => _sharedPreference.getString('id') ?? '';
  String get mobile => _sharedPreference.getString('mobile') ?? '';
  String get photo => _sharedPreference.getString('photo') ?? '';
  String get image1 => _sharedPreference.getString('image') ?? '';

  File? get image => _image;

  Future<void> logout() async {
    _sharedPreference.clear();
    goToLogin();
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    final Uint8List? fileBytes = await pickedImage?.readAsBytes();

    if (pickedImage != null) {
      _image = File(pickedImage.path);
      notifyListeners();
    }
    _sharedPreference.setString('image', pickedImage?.path ?? '');
  }
}
