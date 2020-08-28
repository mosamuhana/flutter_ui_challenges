class Settings {
  static const PRIVATE_ACCOUNT = 'PRIVATE_ACCOUNT';
  static const RECEIVED_NOTIFICATION = 'RECEIVED_NOTIFICATION';
  static const RECEIVED_NEWSLETTER = 'RECEIVED_NEWSLETTER';
  static const RECEIVED_OFFER_NOTIFICATION = 'RECEIVED_OFFER_NOTIFICATION';
  static const RECEIVED_APP_UPDATES = 'RECEIVED_APP_UPDATES';

  Map<String, BoolSetting> _boolSettings = <String, BoolSetting>{
    PRIVATE_ACCOUNT: BoolSetting(title: 'Private Account', value: true, enabled: true),
    RECEIVED_NOTIFICATION: BoolSetting(title: 'Received notification', value: true, enabled: true),
    RECEIVED_NEWSLETTER: BoolSetting(title: 'Received newsletter', value: false, enabled: false),
    RECEIVED_OFFER_NOTIFICATION: BoolSetting(title: 'Received Offer Notification', value: true, enabled: true),
    RECEIVED_APP_UPDATES: BoolSetting(title: 'Received App Updates', value: true, enabled: false),
  };

  BoolSetting get receivedNotification => _boolSettings[RECEIVED_NOTIFICATION];
  BoolSetting get receivedNewsletter => _boolSettings[RECEIVED_NEWSLETTER];
  BoolSetting get receivedOfferNotification => _boolSettings[RECEIVED_OFFER_NOTIFICATION];
  BoolSetting get receivedAppUpdates => _boolSettings[RECEIVED_APP_UPDATES];
  BoolSetting get privateAccount => _boolSettings[PRIVATE_ACCOUNT];
}

class BoolSetting {
  String title;
  bool value;
  bool enabled;
  BoolSetting({this.title, this.value, this.enabled});
}
