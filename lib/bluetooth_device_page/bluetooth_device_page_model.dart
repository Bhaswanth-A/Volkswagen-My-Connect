import '/backend/schema/structs/index.dart';
import '/components/received_data_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'bluetooth_device_page_widget.dart' show BluetoothDevicePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BluetoothDevicePageModel
    extends FlutterFlowModel<BluetoothDevicePageWidget> {
  ///  Local state fields for this page.

  int? currentRssi;

  String? receivedValue;

  ///  State fields for stateful widgets in this page.

  InstantTimer? rssiUpdateTimer;
  // Stores action output result for [Custom Action - getRssi] action in BluetoothDevicePage widget.
  int? updatedRssi;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for ReceivedData component.
  late ReceivedDataModel receivedDataModel;

  @override
  void initState(BuildContext context) {
    receivedDataModel = createModel(context, () => ReceivedDataModel());
  }

  @override
  void dispose() {
    rssiUpdateTimer?.cancel();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    receivedDataModel.dispose();
  }
}
