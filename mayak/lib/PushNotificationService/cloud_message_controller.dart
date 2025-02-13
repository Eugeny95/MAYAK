import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:mayak/PushNotificationService/firebase_cloud_message.dart';
import 'package:mayak/PushNotificationService/huawei_cloud_message.dart';

enum DeviceType {
  androidWithGoogleServices,
  androidWithoutGoogleServices,
  iPhone
}

class CloudMessage {
  static Future<DeviceType> getDiviceType() async {
    if (Platform.isIOS) return DeviceType.iPhone;
    GooglePlayServicesAvailability availability = await GoogleApiAvailability
        .instance
        .checkGooglePlayServicesAvailability();
    switch (availability) {
      case (GooglePlayServicesAvailability.notAvailableOnPlatform):
        {
          return DeviceType.androidWithoutGoogleServices;
        }
      case (GooglePlayServicesAvailability.serviceDisabled):
        return DeviceType.androidWithoutGoogleServices;

      case (GooglePlayServicesAvailability.serviceInvalid):
        {
          return DeviceType.androidWithoutGoogleServices;
        }
      case (GooglePlayServicesAvailability.unknown):
        {
          return DeviceType.androidWithoutGoogleServices;
        }
      case (GooglePlayServicesAvailability.serviceMissing):
        {
          return DeviceType.androidWithoutGoogleServices;
        }
      case (GooglePlayServicesAvailability.serviceUpdating):
        {
          return DeviceType.androidWithGoogleServices;
        }
      case (GooglePlayServicesAvailability.serviceVersionUpdateRequired):
        {
          return DeviceType.androidWithGoogleServices;
        }
      case (GooglePlayServicesAvailability.success):
        {
          return DeviceType.androidWithGoogleServices;
        }

      default:
        return DeviceType.androidWithoutGoogleServices;
    }
  }

  static Future<String> getDeviceTypeStr() async {
    DeviceType deviceType = await getDiviceType();
    switch (deviceType) {
      case (DeviceType.androidWithGoogleServices):
        return 'android_with_google_services';
      case (DeviceType.androidWithoutGoogleServices):
        return 'android_without_google_services';
      case (DeviceType.iPhone):
        return 'iphone';
    }
  }

  static Future<String?> getDeviceToken() async {
    DeviceType deviceType;

    deviceType = await getDiviceType();
    if (deviceType == DeviceType.androidWithGoogleServices ||
        deviceType == DeviceType.iPhone) {
      return await getFirebaseDeviceToken();
    }
    return await getHuaweiDeviceToken();
  }

  static Future<void> startCloudMessageService() async {
    await AwesomeNotifications().initialize(null, [
      // notification icon
      NotificationChannel(
        channelGroupKey: 'message',
        channelKey: 'message',
        channelName: 'message',
        channelDescription: 'message',
        channelShowBadge: true,
        importance: NotificationImportance.High,
        enableVibration: true,
      ),
    ]);
    DeviceType deviceType = await getDiviceType();
    if (deviceType == DeviceType.androidWithGoogleServices ||
        deviceType == DeviceType.iPhone) {
      await startFirebaseCloudMessageService();
    } else {
      await startHuaweiCloudMessageService();
    }
  }
}
