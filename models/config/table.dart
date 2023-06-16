/// #Table
/// The abstract class to provide the data 
abstract class Table {

  ///Define the name of the table to use while creating the database table
  ///
  /// @return [String]
  String getClassName();

  ///Converting the class to JSON representation
  ///
  /// @return [Map<String, dynamic>]
  Map<String, dynamic> toJson();

  /// Create the query string for creating the database table
  ///
  /// @return [String]
  String createQuery();
}
