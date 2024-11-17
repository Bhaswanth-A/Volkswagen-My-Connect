import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'bluetooth_widget.dart' show BluetoothWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BluetoothModel extends FlutterFlowModel<BluetoothWidget> {
  ///  Local state fields for this page.

  bool isFetchingDevices = true;

  bool isBluetoothEnabled = true;

  List<BTDeviceStruct> foundDevices = [];
  void addToFoundDevices(BTDeviceStruct item) => foundDevices.add(item);
  void removeFromFoundDevices(BTDeviceStruct item) => foundDevices.remove(item);
  void removeAtIndexFromFoundDevices(int index) => foundDevices.removeAt(index);
  void insertAtIndexInFoundDevices(int index, BTDeviceStruct item) =>
      foundDevices.insert(index, item);
  void updateFoundDevicesAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      foundDevices[index] = updateFn(foundDevices[index]);

  List<BTDeviceStruct> connectedDevices = [];
  void addToConnectedDevices(BTDeviceStruct item) => connectedDevices.add(item);
  void removeFromConnectedDevices(BTDeviceStruct item) =>
      connectedDevices.remove(item);
  void removeAtIndexFromConnectedDevices(int index) =>
      connectedDevices.removeAt(index);
  void insertAtIndexInConnectedDevices(int index, BTDeviceStruct item) =>
      connectedDevices.insert(index, item);
  void updateConnectedDevicesAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      connectedDevices[index] = updateFn(connectedDevices[index]);

  bool isFetchingConnectedDevices = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getConnectedDevices] action in Bluetooth widget.
  List<BTDeviceStruct>? fetchedConnectedDevices;
  // Stores action output result for [Custom Action - findDevices] action in Bluetooth widget.
  List<BTDeviceStruct>? fetchedDevices;
  // Stores action output result for [Custom Action - connectDevice] action in Container widget.
  bool? hasWrite;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? hasWrite2;
  // Stores action output result for [Custom Action - connectDevice] action in Container widget.
  bool? hasWrite3;
  // Stores action output result for [Custom Action - connectDevice] action in Button widget.
  bool? hasWrite4;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Custom Action - turnOnBluetooth] action in Switch widget.
  bool? isTurningOn;
  // Stores action output result for [Custom Action - getConnectedDevices] action in Switch widget.
  List<BTDeviceStruct>? fetchedConnectedDevices2;
  // Stores action output result for [Custom Action - findDevices] action in Switch widget.
  List<BTDeviceStruct>? fetchedDevices2;
  // Stores action output result for [Custom Action - turnOffBluetooth] action in Switch widget.
  bool? isTurningOff;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
