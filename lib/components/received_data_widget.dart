import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'received_data_model.dart';
export 'received_data_model.dart';

class ReceivedDataWidget extends StatefulWidget {
  const ReceivedDataWidget({super.key});

  @override
  State<ReceivedDataWidget> createState() => _ReceivedDataWidgetState();
}

class _ReceivedDataWidgetState extends State<ReceivedDataWidget> {
  late ReceivedDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReceivedDataModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.receivedDataTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.receivedData = await actions.receiveData(
            BTDeviceStruct(),
          );
          _model.data = _model.receivedData;
          safeSetState(() {});
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.receivedDataTime = InstantTimer.periodic(
          duration: Duration(milliseconds: 1000),
          callback: (timer) async {
            await actions.receiveData(
              BTDeviceStruct(),
            );
          },
          startImmediately: true,
        );
      },
      child: Text(
        '[data]',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              color: Color(0xFFB4B7BB),
              fontSize: 14.0,
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
