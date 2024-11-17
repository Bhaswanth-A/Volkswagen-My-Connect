import '../database.dart';

class CarsTable extends SupabaseTable<CarsRow> {
  @override
  String get tableName => 'cars';

  @override
  CarsRow createRow(Map<String, dynamic> data) => CarsRow(data);
}

class CarsRow extends SupabaseDataRow {
  CarsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get model => getField<String>('model');
  set model(String? value) => setField<String>('model', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  bool? get isACar => getField<bool>('is_a_car');
  set isACar(bool? value) => setField<bool>('is_a_car', value);
}
