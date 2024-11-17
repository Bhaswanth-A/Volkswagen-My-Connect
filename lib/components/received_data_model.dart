import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'received_data_widget.dart' show ReceivedDataWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReceivedDataModel extends FlutterFlowModel<ReceivedDataWidget> {
  ///  Local state fields for this component.

  String? data;

  ///  State fields for stateful widgets in this component.

  InstantTimer? receivedDataTimer;
  // Stores action output result for [Custom Action - receiveData] action in ReceivedData widget.
  String? receivedData;
  InstantTimer? receivedDataTime;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    receivedDataTimer?.cancel();
    receivedDataTime?.cancel();
  }
}
