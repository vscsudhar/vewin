// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vewin/app/app.locator.dart';
import 'package:vewin/core/models/bank_acc_add_model.dart';
import 'package:vewin/core/models/best_performer_model.dart';
import 'package:vewin/core/models/customer_list_details.dart';
import 'package:vewin/core/models/customer_list_model.dart';
import 'package:vewin/core/models/forgot_pass_mobile_otp.dart';
import 'package:vewin/core/models/forgot_pass_otp_verify.dart';
import 'package:vewin/core/models/get_sales_details_model.dart';
import 'package:vewin/core/models/login_response_model.dart';
import 'package:vewin/core/models/monthly_sale_model.dart';
import 'package:vewin/core/models/pan_add_model.dart';
import 'package:vewin/core/models/profile_imageUpdate_model.dart';
import 'package:vewin/core/models/profile_image_model.dart';
import 'package:vewin/core/models/profile_update_model.dart';
import 'package:vewin/core/models/regiseter_verified_otp_model.dart';
import 'package:vewin/core/models/register_model.dart';
import 'package:vewin/core/models/update_pass_verify.dart';
import 'package:vewin/services/user_authentication_service.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService init() {
    final dio = Dio();
    dio.options.baseUrl = 'https://vewin.vewinpro.com';
    try {
      if (locator<UserAuthenticationService>().token.isNotEmpty) {
        log(locator<UserAuthenticationService>().token);
        dio.options.headers['Authorization'] = 'Bearer ${locator<UserAuthenticationService>().token}';
        dio.interceptors.add(PrettyDioLogger(requestBody: true));
      }
    } catch (e) {
      print(e);
    }
    return ApiService(dio);
  }

  @POST('/api/User/SendOTP')
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);

  @POST('/api/User/VerifyMobileAndOTP')
  Future<VerifiedOtpResponse> otpVerified(@Body() VerifiedOtpRequest verifiedOtpResponse);

  @PUT('/api/Forgetpassword/ForgetPasswordOtp')
  Future<ForgotPasswordResponse> forPass(@Body() ForgotPasswordRequest forgotPasswordRequest);

  @GET('/api/Forgetpassword/FrogetPasswordVerification?Mobile={mobile}&OTP={otp}')
  Future<ForgotPasswordVerifyResponse> forVerifyOtp(@Path('mobile') String mobile, @Path('otp') String otp);

  @PUT('/api/Forgetpassword/UpdatePassword')
  Future<UpdatePasswordResponse> updatePass(@Body() UpdatePasswordRequest updatePasswordRequest);

  @POST('/Login')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST('/api/Kyc/AddPanDetails')
  Future<PanNoAddResponse> panAdd(@Body() PanAddRequest panAddRequest);

  @POST('/api/Kyc/AddBankDetails')
  Future<BankAccountAddResponse> addBank(@Body() BankAccountAddRequest bankAccountAddRequest);

  @PUT('/api/User/UpdateUser/{id}')
  Future<ProfileUpdateResponse> updateProfile(@Path('id') String id);

  @POST('/api/Sales/GetSales')
  Future<MonthlySaleResponse> monthlySaleRes(@Body() MonthlySaleRequest monthlySaleRequest);

  @POST('/api/Sales/GetSalesDetails')
  Future<List<GetSalesDetailsResponse>> getSalesDetails(@Body() GetSalesDetailsRequest getSalesDetailsRequest);

  @GET('/api/CustomerList/GetCustomsersCount?id={id}')
  Future<CustomerListCountResponse> getCustomerCount(@Path('id') int id);

  @GET('/api/CustomerList/GetCustomsersDetails?Appname={appName}&id={id}')
  Future<List<CustomerListDetailsResponse>> getCustomerDetails(@Path('appName') String appPickup, @Path('id') int id);

  @GET('/api/Bestperformer/GetBestperformer')
  Future<List<BestPerformerResponse>> getBestPerformer();

  @POST('/api/User/AddProfileById')
  Future<dynamic> getProfileImage(@Body() ProfileImageUpdateRequest profileImageUpdateRequest);

  @POST('/api/User/GetProfile?id={id}')
  Future<ProfileImageUpdateResponse> updateProfileImage(@Path('id') String id);
}
