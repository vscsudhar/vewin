// Mocks generated by Mockito 5.4.2 from annotations
// in vewin/test/helpers/test_helpers.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i13;
import 'dart:ui' as _i14;

import 'package:flutter/material.dart' as _i12;
import 'package:mockito/mockito.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;
import 'package:vewin/core/models/bank_acc_add_model.dart' as _i9;
import 'package:vewin/core/models/forgot_pass_mobile_otp.dart' as _i4;
import 'package:vewin/core/models/forgot_pass_otp_verify.dart' as _i5;
import 'package:vewin/core/models/login_response_model.dart' as _i7;
import 'package:vewin/core/models/pan_add_model.dart' as _i8;
import 'package:vewin/core/models/profile_update_model.dart' as _i10;
import 'package:vewin/core/models/regiseter_verified_otp_model.dart' as _i3;
import 'package:vewin/core/models/register_model.dart' as _i2;
import 'package:vewin/core/models/update_pass_verify.dart' as _i6;
import 'package:vewin/services/api_service.dart' as _i15;
import 'package:vewin/services/user_authentication_service.dart' as _i16;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRegisterResponse_0 extends _i1.SmartFake
    implements _i2.RegisterResponse {
  _FakeRegisterResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeVerifiedOtpResponse_1 extends _i1.SmartFake
    implements _i3.VerifiedOtpResponse {
  _FakeVerifiedOtpResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeForgotPasswordResponse_2 extends _i1.SmartFake
    implements _i4.ForgotPasswordResponse {
  _FakeForgotPasswordResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeForgotPasswordVerifyResponse_3 extends _i1.SmartFake
    implements _i5.ForgotPasswordVerifyResponse {
  _FakeForgotPasswordVerifyResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUpdatePasswordResponse_4 extends _i1.SmartFake
    implements _i6.UpdatePasswordResponse {
  _FakeUpdatePasswordResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoginResponse_5 extends _i1.SmartFake implements _i7.LoginResponse {
  _FakeLoginResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePanNoAddResponse_6 extends _i1.SmartFake
    implements _i8.PanNoAddResponse {
  _FakePanNoAddResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBankAccountAddResponse_7 extends _i1.SmartFake
    implements _i9.BankAccountAddResponse {
  _FakeBankAccountAddResponse_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProfileUpdateResponse_8 extends _i1.SmartFake
    implements _i10.ProfileUpdateResponse {
  _FakeProfileUpdateResponse_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i11.NavigationService {
  @override
  String get previousRoute => (super.noSuchMethod(
        Invocation.getter(#previousRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  String get currentRoute => (super.noSuchMethod(
        Invocation.getter(#currentRoute),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  _i12.GlobalKey<_i12.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(
        Invocation.method(
          #nestedNavigationKey,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i12.GlobalKey<_i12.NavigatorState>?);

  @override
  void config({
    bool? enableLog,
    bool? defaultPopGesture,
    bool? defaultOpaqueRoute,
    Duration? defaultDurationTransition,
    bool? defaultGlobalState,
    _i11.Transition? defaultTransitionStyle,
    String? defaultTransition,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #config,
          [],
          {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransitionStyle: defaultTransitionStyle,
            #defaultTransition: defaultTransition,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i13.Future<T?>? navigateWithTransition<T>(
    _i12.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i12.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i11.Transition? transitionClass,
    _i11.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i13.Future<T?>?);

  @override
  _i13.Future<T?>? replaceWithTransition<T>(
    _i12.Widget? page, {
    bool? opaque,
    String? transition = r'',
    Duration? duration,
    bool? popGesture,
    int? id,
    _i12.Curve? curve,
    bool? fullscreenDialog = false,
    bool? preventDuplicates = true,
    _i11.Transition? transitionClass,
    _i11.Transition? transitionStyle,
    String? routeName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWithTransition,
          [page],
          {
            #opaque: opaque,
            #transition: transition,
            #duration: duration,
            #popGesture: popGesture,
            #id: id,
            #curve: curve,
            #fullscreenDialog: fullscreenDialog,
            #preventDuplicates: preventDuplicates,
            #transitionClass: transitionClass,
            #transitionStyle: transitionStyle,
            #routeName: routeName,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i13.Future<T?>?);

  @override
  bool back<T>({
    dynamic result,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #back,
          [],
          {
            #result: result,
            #id: id,
          },
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void popUntil(
    _i12.RoutePredicate? predicate, {
    int? id,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #popUntil,
          [predicate],
          {#id: id},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void popRepeated(int? popTimes) => super.noSuchMethod(
        Invocation.method(
          #popRepeated,
          [popTimes],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i13.Future<T?>? navigateTo<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i12.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateTo,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i13.Future<T?>?);

  @override
  _i13.Future<T?>? navigateToView<T>(
    _i12.Widget? view, {
    dynamic arguments,
    int? id,
    bool? opaque,
    _i12.Curve? curve,
    Duration? duration,
    bool? fullscreenDialog = false,
    bool? popGesture,
    bool? preventDuplicates = true,
    _i11.Transition? transition,
    _i11.Transition? transitionStyle,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #navigateToView,
          [view],
          {
            #arguments: arguments,
            #id: id,
            #opaque: opaque,
            #curve: curve,
            #duration: duration,
            #fullscreenDialog: fullscreenDialog,
            #popGesture: popGesture,
            #preventDuplicates: preventDuplicates,
            #transition: transition,
            #transitionStyle: transitionStyle,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i13.Future<T?>?);

  @override
  _i13.Future<T?>? replaceWith<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
    _i12.RouteTransitionsBuilder? transition,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceWith,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
            #transition: transition,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i13.Future<T?>?);

  @override
  _i13.Future<T?>? clearStackAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i13.Future<T?>?);

  @override
  _i13.Future<T?>? clearStackAndShowView<T>(
    _i12.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearStackAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i13.Future<T?>?);

  @override
  _i13.Future<T?>? clearTillFirstAndShow<T>(
    String? routeName, {
    dynamic arguments,
    int? id,
    bool? preventDuplicates = true,
    Map<String, String>? parameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShow,
          [routeName],
          {
            #arguments: arguments,
            #id: id,
            #preventDuplicates: preventDuplicates,
            #parameters: parameters,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i13.Future<T?>?);

  @override
  _i13.Future<T?>? clearTillFirstAndShowView<T>(
    _i12.Widget? view, {
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #clearTillFirstAndShowView,
          [view],
          {
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i13.Future<T?>?);

  @override
  _i13.Future<T?>? pushNamedAndRemoveUntil<T>(
    String? routeName, {
    _i12.RoutePredicate? predicate,
    dynamic arguments,
    int? id,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamedAndRemoveUntil,
          [routeName],
          {
            #predicate: predicate,
            #arguments: arguments,
            #id: id,
          },
        ),
        returnValueForMissingStub: null,
      ) as _i13.Future<T?>?);
}

/// A class which mocks [BottomSheetService].
///
/// See the documentation for Mockito's code generation for more information.
class MockBottomSheetService extends _i1.Mock
    implements _i11.BottomSheetService {
  @override
  void setCustomSheetBuilders(Map<dynamic, _i11.SheetBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #setCustomSheetBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i13.Future<_i11.SheetResponse<dynamic>?> showBottomSheet({
    required String? title,
    String? description,
    String? confirmButtonTitle = r'Ok',
    String? cancelButtonTitle,
    bool? enableDrag = true,
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showBottomSheet,
          [],
          {
            #title: title,
            #description: description,
            #confirmButtonTitle: confirmButtonTitle,
            #cancelButtonTitle: cancelButtonTitle,
            #enableDrag: enableDrag,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i13.Future<_i11.SheetResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i13.Future<_i11.SheetResponse<dynamic>?>.value(),
      ) as _i13.Future<_i11.SheetResponse<dynamic>?>);

  @override
  _i13.Future<_i11.SheetResponse<T>?> showCustomSheet<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i14.Color? barrierColor = const _i14.Color(2315255808),
    bool? barrierDismissible = true,
    bool? isScrollControlled = false,
    String? barrierLabel = r'',
    dynamic customData,
    R? data,
    bool? enableDrag = true,
    Duration? exitBottomSheetDuration,
    Duration? enterBottomSheetDuration,
    bool? ignoreSafeArea,
    bool? useRootNavigator = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomSheet,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #isScrollControlled: isScrollControlled,
            #barrierLabel: barrierLabel,
            #customData: customData,
            #data: data,
            #enableDrag: enableDrag,
            #exitBottomSheetDuration: exitBottomSheetDuration,
            #enterBottomSheetDuration: enterBottomSheetDuration,
            #ignoreSafeArea: ignoreSafeArea,
            #useRootNavigator: useRootNavigator,
          },
        ),
        returnValue: _i13.Future<_i11.SheetResponse<T>?>.value(),
        returnValueForMissingStub: _i13.Future<_i11.SheetResponse<T>?>.value(),
      ) as _i13.Future<_i11.SheetResponse<T>?>);

  @override
  void completeSheet(_i11.SheetResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeSheet,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i11.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i11.DialogBuilder>? builders) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilders,
          [builders],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerCustomDialogBuilder({
    required dynamic variant,
    required _i12.Widget Function(
      _i12.BuildContext,
      _i11.DialogRequest<dynamic>,
      dynamic Function(_i11.DialogResponse<dynamic>),
    )? builder,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerCustomDialogBuilder,
          [],
          {
            #variant: variant,
            #builder: builder,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i13.Future<_i11.DialogResponse<dynamic>?> showDialog({
    String? title,
    String? description,
    String? cancelTitle,
    _i14.Color? cancelTitleColor,
    String? buttonTitle = r'Ok',
    _i14.Color? buttonTitleColor,
    bool? barrierDismissible = false,
    _i11.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #buttonTitle: buttonTitle,
            #buttonTitleColor: buttonTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i13.Future<_i11.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i13.Future<_i11.DialogResponse<dynamic>?>.value(),
      ) as _i13.Future<_i11.DialogResponse<dynamic>?>);

  @override
  _i13.Future<_i11.DialogResponse<T>?> showCustomDialog<T, R>({
    dynamic variant,
    String? title,
    String? description,
    bool? hasImage = false,
    String? imageUrl,
    bool? showIconInMainButton = false,
    String? mainButtonTitle,
    bool? showIconInSecondaryButton = false,
    String? secondaryButtonTitle,
    bool? showIconInAdditionalButton = false,
    String? additionalButtonTitle,
    bool? takesInput = false,
    _i14.Color? barrierColor = const _i14.Color(2315255808),
    bool? barrierDismissible = false,
    String? barrierLabel = r'',
    bool? useSafeArea = true,
    dynamic customData,
    R? data,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showCustomDialog,
          [],
          {
            #variant: variant,
            #title: title,
            #description: description,
            #hasImage: hasImage,
            #imageUrl: imageUrl,
            #showIconInMainButton: showIconInMainButton,
            #mainButtonTitle: mainButtonTitle,
            #showIconInSecondaryButton: showIconInSecondaryButton,
            #secondaryButtonTitle: secondaryButtonTitle,
            #showIconInAdditionalButton: showIconInAdditionalButton,
            #additionalButtonTitle: additionalButtonTitle,
            #takesInput: takesInput,
            #barrierColor: barrierColor,
            #barrierDismissible: barrierDismissible,
            #barrierLabel: barrierLabel,
            #useSafeArea: useSafeArea,
            #customData: customData,
            #data: data,
          },
        ),
        returnValue: _i13.Future<_i11.DialogResponse<T>?>.value(),
        returnValueForMissingStub: _i13.Future<_i11.DialogResponse<T>?>.value(),
      ) as _i13.Future<_i11.DialogResponse<T>?>);

  @override
  _i13.Future<_i11.DialogResponse<dynamic>?> showConfirmationDialog({
    String? title,
    String? description,
    String? cancelTitle = r'Cancel',
    _i14.Color? cancelTitleColor,
    String? confirmationTitle = r'Ok',
    _i14.Color? confirmationTitleColor,
    bool? barrierDismissible = false,
    _i11.DialogPlatform? dialogPlatform,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #showConfirmationDialog,
          [],
          {
            #title: title,
            #description: description,
            #cancelTitle: cancelTitle,
            #cancelTitleColor: cancelTitleColor,
            #confirmationTitle: confirmationTitle,
            #confirmationTitleColor: confirmationTitleColor,
            #barrierDismissible: barrierDismissible,
            #dialogPlatform: dialogPlatform,
          },
        ),
        returnValue: _i13.Future<_i11.DialogResponse<dynamic>?>.value(),
        returnValueForMissingStub:
            _i13.Future<_i11.DialogResponse<dynamic>?>.value(),
      ) as _i13.Future<_i11.DialogResponse<dynamic>?>);

  @override
  void completeDialog(_i11.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(
        Invocation.method(
          #completeDialog,
          [response],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i15.ApiService {
  @override
  _i13.Future<_i2.RegisterResponse> register(
          _i2.RegisterRequest? registerRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [registerRequest],
        ),
        returnValue:
            _i13.Future<_i2.RegisterResponse>.value(_FakeRegisterResponse_0(
          this,
          Invocation.method(
            #register,
            [registerRequest],
          ),
        )),
        returnValueForMissingStub:
            _i13.Future<_i2.RegisterResponse>.value(_FakeRegisterResponse_0(
          this,
          Invocation.method(
            #register,
            [registerRequest],
          ),
        )),
      ) as _i13.Future<_i2.RegisterResponse>);

  @override
  _i13.Future<_i3.VerifiedOtpResponse> otpVerified(
    String? mobile,
    String? otp,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #otpVerified,
          [
            mobile,
            otp,
          ],
        ),
        returnValue: _i13.Future<_i3.VerifiedOtpResponse>.value(
            _FakeVerifiedOtpResponse_1(
          this,
          Invocation.method(
            #otpVerified,
            [
              mobile,
              otp,
            ],
          ),
        )),
        returnValueForMissingStub: _i13.Future<_i3.VerifiedOtpResponse>.value(
            _FakeVerifiedOtpResponse_1(
          this,
          Invocation.method(
            #otpVerified,
            [
              mobile,
              otp,
            ],
          ),
        )),
      ) as _i13.Future<_i3.VerifiedOtpResponse>);

  @override
  _i13.Future<_i4.ForgotPasswordResponse> forPass(
          _i4.ForgotPasswordRequest? forgotPasswordRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #forPass,
          [forgotPasswordRequest],
        ),
        returnValue: _i13.Future<_i4.ForgotPasswordResponse>.value(
            _FakeForgotPasswordResponse_2(
          this,
          Invocation.method(
            #forPass,
            [forgotPasswordRequest],
          ),
        )),
        returnValueForMissingStub:
            _i13.Future<_i4.ForgotPasswordResponse>.value(
                _FakeForgotPasswordResponse_2(
          this,
          Invocation.method(
            #forPass,
            [forgotPasswordRequest],
          ),
        )),
      ) as _i13.Future<_i4.ForgotPasswordResponse>);

  @override
  _i13.Future<_i5.ForgotPasswordVerifyResponse> forVerifyOtp(
    String? mobile,
    String? otp,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #forVerifyOtp,
          [
            mobile,
            otp,
          ],
        ),
        returnValue: _i13.Future<_i5.ForgotPasswordVerifyResponse>.value(
            _FakeForgotPasswordVerifyResponse_3(
          this,
          Invocation.method(
            #forVerifyOtp,
            [
              mobile,
              otp,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i13.Future<_i5.ForgotPasswordVerifyResponse>.value(
                _FakeForgotPasswordVerifyResponse_3(
          this,
          Invocation.method(
            #forVerifyOtp,
            [
              mobile,
              otp,
            ],
          ),
        )),
      ) as _i13.Future<_i5.ForgotPasswordVerifyResponse>);

  @override
  _i13.Future<_i6.UpdatePasswordResponse> updatePass(
          _i6.UpdatePasswordRequest? updatePasswordRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #updatePass,
          [updatePasswordRequest],
        ),
        returnValue: _i13.Future<_i6.UpdatePasswordResponse>.value(
            _FakeUpdatePasswordResponse_4(
          this,
          Invocation.method(
            #updatePass,
            [updatePasswordRequest],
          ),
        )),
        returnValueForMissingStub:
            _i13.Future<_i6.UpdatePasswordResponse>.value(
                _FakeUpdatePasswordResponse_4(
          this,
          Invocation.method(
            #updatePass,
            [updatePasswordRequest],
          ),
        )),
      ) as _i13.Future<_i6.UpdatePasswordResponse>);

  @override
  _i13.Future<_i7.LoginResponse> login(
    String? mobile,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            mobile,
            password,
          ],
        ),
        returnValue: _i13.Future<_i7.LoginResponse>.value(_FakeLoginResponse_5(
          this,
          Invocation.method(
            #login,
            [
              mobile,
              password,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i13.Future<_i7.LoginResponse>.value(_FakeLoginResponse_5(
          this,
          Invocation.method(
            #login,
            [
              mobile,
              password,
            ],
          ),
        )),
      ) as _i13.Future<_i7.LoginResponse>);

  @override
  _i13.Future<_i8.PanNoAddResponse> panAdd(_i8.PanAddRequest? panAddRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #panAdd,
          [panAddRequest],
        ),
        returnValue:
            _i13.Future<_i8.PanNoAddResponse>.value(_FakePanNoAddResponse_6(
          this,
          Invocation.method(
            #panAdd,
            [panAddRequest],
          ),
        )),
        returnValueForMissingStub:
            _i13.Future<_i8.PanNoAddResponse>.value(_FakePanNoAddResponse_6(
          this,
          Invocation.method(
            #panAdd,
            [panAddRequest],
          ),
        )),
      ) as _i13.Future<_i8.PanNoAddResponse>);

  @override
  _i13.Future<_i9.BankAccountAddResponse> addBank(
          _i9.BankAccountAddRequest? bankAccountAddRequest) =>
      (super.noSuchMethod(
        Invocation.method(
          #addBank,
          [bankAccountAddRequest],
        ),
        returnValue: _i13.Future<_i9.BankAccountAddResponse>.value(
            _FakeBankAccountAddResponse_7(
          this,
          Invocation.method(
            #addBank,
            [bankAccountAddRequest],
          ),
        )),
        returnValueForMissingStub:
            _i13.Future<_i9.BankAccountAddResponse>.value(
                _FakeBankAccountAddResponse_7(
          this,
          Invocation.method(
            #addBank,
            [bankAccountAddRequest],
          ),
        )),
      ) as _i13.Future<_i9.BankAccountAddResponse>);

  @override
  _i13.Future<_i10.ProfileUpdateResponse> updateProfile(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProfile,
          [id],
        ),
        returnValue: _i13.Future<_i10.ProfileUpdateResponse>.value(
            _FakeProfileUpdateResponse_8(
          this,
          Invocation.method(
            #updateProfile,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i13.Future<_i10.ProfileUpdateResponse>.value(
                _FakeProfileUpdateResponse_8(
          this,
          Invocation.method(
            #updateProfile,
            [id],
          ),
        )),
      ) as _i13.Future<_i10.ProfileUpdateResponse>);
}

/// A class which mocks [UserAuthenticationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserAuthenticationService extends _i1.Mock
    implements _i16.UserAuthenticationService {
  @override
  String get token => (super.noSuchMethod(
        Invocation.getter(#token),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  String get userCredentials => (super.noSuchMethod(
        Invocation.getter(#userCredentials),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);

  @override
  _i7.LoginResponse get loginResponse => (super.noSuchMethod(
        Invocation.getter(#loginResponse),
        returnValue: _FakeLoginResponse_5(
          this,
          Invocation.getter(#loginResponse),
        ),
        returnValueForMissingStub: _FakeLoginResponse_5(
          this,
          Invocation.getter(#loginResponse),
        ),
      ) as _i7.LoginResponse);

  @override
  _i13.Future<dynamic> login(
    String? mobile,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            mobile,
            password,
          ],
        ),
        returnValue: _i13.Future<dynamic>.value(),
        returnValueForMissingStub: _i13.Future<dynamic>.value(),
      ) as _i13.Future<dynamic>);

  @override
  _i13.Future<void> refreshSession() => (super.noSuchMethod(
        Invocation.method(
          #refreshSession,
          [],
        ),
        returnValue: _i13.Future<void>.value(),
        returnValueForMissingStub: _i13.Future<void>.value(),
      ) as _i13.Future<void>);

  @override
  void goToLogin() => super.noSuchMethod(
        Invocation.method(
          #goToLogin,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToWalletInfo() => super.noSuchMethod(
        Invocation.method(
          #goToWalletInfo,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToCustomerList() => super.noSuchMethod(
        Invocation.method(
          #goToCustomerList,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToBestPerformer() => super.noSuchMethod(
        Invocation.method(
          #goToBestPerformer,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToChangePassword() => super.noSuchMethod(
        Invocation.method(
          #goToChangePassword,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToDashboard() => super.noSuchMethod(
        Invocation.method(
          #goToDashboard,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToRegister() => super.noSuchMethod(
        Invocation.method(
          #goToRegister,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToProfile() => super.noSuchMethod(
        Invocation.method(
          #goToProfile,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToSales() => super.noSuchMethod(
        Invocation.method(
          #goToSales,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToPan() => super.noSuchMethod(
        Invocation.method(
          #goToPan,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToHistory() => super.noSuchMethod(
        Invocation.method(
          #goToHistory,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToBankAccount() => super.noSuchMethod(
        Invocation.method(
          #goToBankAccount,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToOtpRegister() => super.noSuchMethod(
        Invocation.method(
          #goToOtpRegister,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToForgotPass() => super.noSuchMethod(
        Invocation.method(
          #goToForgotPass,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToResetPass() => super.noSuchMethod(
        Invocation.method(
          #goToResetPass,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goToSetPassOtp() => super.noSuchMethod(
        Invocation.method(
          #goToSetPassOtp,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
