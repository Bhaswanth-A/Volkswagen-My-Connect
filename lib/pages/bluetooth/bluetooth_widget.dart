import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bluetooth_model.dart';
export 'bluetooth_model.dart';

class BluetoothWidget extends StatefulWidget {
  /// flutter\_blue
  const BluetoothWidget({
    super.key,
    required this.isBTEnabled,
    required this.displayDevices,
    this.displayAvailableDevices,
  });

  final bool? isBTEnabled;
  final BTDeviceStruct? displayDevices;
  final String? displayAvailableDevices;

  @override
  State<BluetoothWidget> createState() => _BluetoothWidgetState();
}

class _BluetoothWidgetState extends State<BluetoothWidget> {
  late BluetoothModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BluetoothModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isBluetoothEnabled = widget!.isBTEnabled!;
      safeSetState(() {});
      if (_model.isBluetoothEnabled) {
        _model.isFetchingConnectedDevices = true;
        _model.isFetchingDevices = true;
        safeSetState(() {});
        _model.fetchedConnectedDevices = await actions.getConnectedDevices();
        _model.isFetchingConnectedDevices = false;
        _model.connectedDevices =
            _model.fetchedConnectedDevices!.toList().cast<BTDeviceStruct>();
        safeSetState(() {});
        _model.fetchedDevices = await actions.findDevices();
        _model.isFetchingDevices = false;
        _model.foundDevices =
            _model.fetchedDevices!.toList().cast<BTDeviceStruct>();
        safeSetState(() {});
      }
    });

    _model.switchValue = widget!.isBTEnabled!;
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 50.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 20.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Bluetooth',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF002A78),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Available Devices',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Container(
                          height: 200.0,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.hasWrite =
                                        await actions.connectDevice(
                                      widget!.displayDevices!,
                                    );
                                    _model.addToConnectedDevices(
                                        widget!.displayDevices!);
                                    safeSetState(() {});

                                    context.pushNamed(
                                      'BluetoothDevicePage',
                                      queryParameters: {
                                        'deviceName': serializeParam(
                                          widget!.displayDevices?.name,
                                          ParamType.String,
                                        ),
                                        'deviceId': serializeParam(
                                          widget!.displayDevices?.id,
                                          ParamType.String,
                                        ),
                                        'deviceRssi': serializeParam(
                                          widget!.displayDevices?.rssi,
                                          ParamType.int,
                                        ),
                                        'hasWriteCharacteristic':
                                            serializeParam(
                                          _model.hasWrite,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );

                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF021526),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.bluetooth,
                                                color: Color(0xFF39D2C0),
                                                size: 24.0,
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'VW Connect',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Not Connected',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFFB4B7BB),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              _model.hasWrite2 =
                                                  await actions.connectDevice(
                                                widget!.displayDevices!,
                                              );
                                              _model.addToConnectedDevices(
                                                  widget!.displayDevices!);
                                              safeSetState(() {});

                                              context.pushNamed(
                                                'BluetoothDevicePage',
                                                queryParameters: {
                                                  'deviceName': serializeParam(
                                                    widget!
                                                        .displayDevices?.name,
                                                    ParamType.String,
                                                  ),
                                                  'deviceId': serializeParam(
                                                    widget!.displayDevices?.id,
                                                    ParamType.String,
                                                  ),
                                                  'deviceRssi': serializeParam(
                                                    widget!
                                                        .displayDevices?.rssi,
                                                    ParamType.int,
                                                  ),
                                                  'hasWriteCharacteristic':
                                                      serializeParam(
                                                    _model.hasWrite2,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              safeSetState(() {});
                                            },
                                            text: 'Connect',
                                            options: FFButtonOptions(
                                              width: 100.0,
                                              height: 36.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF4B39EF),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.hasWrite3 =
                                        await actions.connectDevice(
                                      widget!.displayDevices!,
                                    );
                                    _model.addToConnectedDevices(
                                        widget!.displayDevices!);
                                    safeSetState(() {});

                                    context.pushNamed(
                                      'BluetoothDevicePage',
                                      queryParameters: {
                                        'deviceName': serializeParam(
                                          widget!.displayDevices?.name,
                                          ParamType.String,
                                        ),
                                        'deviceId': serializeParam(
                                          widget!.displayDevices?.id,
                                          ParamType.String,
                                        ),
                                        'deviceRssi': serializeParam(
                                          widget!.displayDevices?.rssi,
                                          ParamType.int,
                                        ),
                                        'hasWriteCharacteristic':
                                            serializeParam(
                                          _model.hasWrite3,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );

                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF021526),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.bluetooth,
                                                color: Color(0xFF39D2C0),
                                                size: 24.0,
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Car Stereo',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Not Connected',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFFB4B7BB),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(SizedBox(width: 12.0)),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              _model.hasWrite4 =
                                                  await actions.connectDevice(
                                                widget!.displayDevices!,
                                              );
                                              _model.addToConnectedDevices(
                                                  widget!.displayDevices!);
                                              safeSetState(() {});

                                              context.pushNamed(
                                                'BluetoothDevicePage',
                                                queryParameters: {
                                                  'deviceName': serializeParam(
                                                    widget!
                                                        .displayDevices?.name,
                                                    ParamType.String,
                                                  ),
                                                  'deviceId': serializeParam(
                                                    widget!.displayDevices?.id,
                                                    ParamType.String,
                                                  ),
                                                  'deviceRssi': serializeParam(
                                                    widget!
                                                        .displayDevices?.rssi,
                                                    ParamType.int,
                                                  ),
                                                  'hasWriteCharacteristic':
                                                      serializeParam(
                                                    _model.hasWrite4,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              safeSetState(() {});
                                            },
                                            text: 'Connect',
                                            options: FFButtonOptions(
                                              width: 100.0,
                                              height: 36.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF4B39EF),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 8.0)),
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF002A78),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Connected Devices',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Container(
                          height: 100.0,
                          child: Builder(
                            builder: (context) {
                              final displayConnectedDevices =
                                  _model.connectedDevices.toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: displayConnectedDevices.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 8.0),
                                itemBuilder:
                                    (context, displayConnectedDevicesIndex) {
                                  final displayConnectedDevicesItem =
                                      displayConnectedDevices[
                                          displayConnectedDevicesIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 12.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'BluetoothDevicePage',
                                          queryParameters: {
                                            'deviceName': serializeParam(
                                              displayConnectedDevicesItem.name,
                                              ParamType.String,
                                            ),
                                            'deviceId': serializeParam(
                                              displayConnectedDevicesItem.id,
                                              ParamType.String,
                                            ),
                                            'deviceRssi': serializeParam(
                                              displayConnectedDevicesItem.rssi,
                                              ParamType.int,
                                            ),
                                            'hasWriteCharacteristic':
                                                serializeParam(
                                              true,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF003BA6),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              'BluetoothDevicePage',
                                              queryParameters: {
                                                'deviceName': serializeParam(
                                                  displayConnectedDevicesItem
                                                      .name,
                                                  ParamType.String,
                                                ),
                                                'deviceId': serializeParam(
                                                  displayConnectedDevicesItem
                                                      .id,
                                                  ParamType.String,
                                                ),
                                                'deviceRssi': serializeParam(
                                                  displayConnectedDevicesItem
                                                      .rssi,
                                                  ParamType.int,
                                                ),
                                                'hasWriteCharacteristic':
                                                    serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.signal_cellular_alt,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 24.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .bluetooth_connected,
                                                          color:
                                                              Color(0xFF39D2C0),
                                                          size: 24.0,
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              displayConnectedDevicesItem
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Connected',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Color(
                                                                        0xFF39D2C0),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: 'Disconnect',
                                                      options: FFButtonOptions(
                                                        width: 100.0,
                                                        height: 36.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xFFFF5963),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(18.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_back,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF002A78),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Bluetooth Settings',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Inter Tight',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Bluetooth',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Switch(
                              value: _model.switchValue!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.switchValue = newValue!);
                                if (newValue!) {
                                  _model.isTurningOn =
                                      await actions.turnOnBluetooth();
                                  await Future.delayed(
                                      const Duration(milliseconds: 1000));
                                  _model.isBluetoothEnabled = true;
                                  safeSetState(() {});
                                  _model.isBluetoothEnabled =
                                      widget!.isBTEnabled!;
                                  safeSetState(() {});
                                  if (_model.isBluetoothEnabled) {
                                    _model.isFetchingConnectedDevices = true;
                                    _model.isFetchingDevices = true;
                                    safeSetState(() {});
                                    _model.fetchedConnectedDevices2 =
                                        await actions.getConnectedDevices();
                                    _model.isFetchingConnectedDevices = false;
                                    _model.connectedDevices = _model
                                        .fetchedConnectedDevices!
                                        .toList()
                                        .cast<BTDeviceStruct>();
                                    safeSetState(() {});
                                    _model.fetchedDevices2 =
                                        await actions.findDevices();
                                    _model.isFetchingDevices = false;
                                    _model.foundDevices = _model.fetchedDevices!
                                        .toList()
                                        .cast<BTDeviceStruct>();
                                    safeSetState(() {});
                                  }

                                  safeSetState(() {});
                                } else {
                                  _model.isTurningOff =
                                      await actions.turnOffBluetooth();
                                  _model.isBluetoothEnabled = false;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                }
                              },
                              activeColor: Color(0xFF39D2C0),
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              inactiveThumbColor: Color(0xFF57636C),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Scan for Devices',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF4B39EF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
