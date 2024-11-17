import '../database.dart';

class UserCarDataTable extends SupabaseTable<UserCarDataRow> {
  @override
  String get tableName => 'user-car-data';

  @override
  UserCarDataRow createRow(Map<String, dynamic> data) => UserCarDataRow(data);
}

class UserCarDataRow extends SupabaseDataRow {
  UserCarDataRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserCarDataTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get model => getField<String>('model');
  set model(String? value) => setField<String>('model', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);
}
