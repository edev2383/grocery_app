class Globals {
  static String usersTable = 'users';
  static String storesTable = 'stores';
  static String listsTable = 'lists';
  static String itemsTable = 'items';
  static String listsItemsRelTable = 'lists_items_rel';
  static String storesItemsRelTable = 'stores_items_rel';
  static String itemCategoryTable = 'item_category';
  static String itemTypeTable = 'item_type';
  static String storeSequenceTable = 'store_sequence';
  static String listSequenceTable = 'list_sequence';

  /// The source of the data. This is used to determine how to handle the data.
  /// Testing data will be able to target specific data sources and production
  /// data will be able to ignore test data.
  static int sourceUnitTests = 1;
  static int sourceIntegrationTests = 2;
  static int sourceApplication = 3;
}
