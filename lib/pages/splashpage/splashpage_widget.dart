import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splashpage_model.dart';
export 'splashpage_model.dart';

class SplashpageWidget extends StatefulWidget {
  /// generate splash page for bluetooth to fetch bluetooth status
  const SplashpageWidget({super.key});

  @override
  State<SplashpageWidget> createState() => _SplashpageWidgetState();
}

class _SplashpageWidgetState extends State<SplashpageWidget> {
  late SplashpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashpageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(bluetoothPermission);
      _model.bluetoothEnabled = await actions.isBluetoothEnabled();
      if (Navigator.of(context).canPop()) {
        context.pop();
      }
      context.pushNamed(
        'Bluetooth',
        queryParameters: {
          'isBTEnabled': serializeParam(
            _model.bluetoothEnabled,
            ParamType.bool,
          ),
          'displayDevices': serializeParam(
            BTDeviceStruct(),
            ParamType.DataStruct,
          ),
          'displayAvailableDevices': serializeParam(
            '',
            ParamType.String,
          ),
        }.withoutNulls,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF001B50),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            child: Text(
              'VOLKSWAGEN',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Inter',
                    color: Color(0xFFB4B7BB),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
