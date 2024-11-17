import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/chatbubbles/chatbubbles_widget.dart';
import 'chatui_widget.dart' show ChatuiWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatuiModel extends FlutterFlowModel<ChatuiWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for chatbubbles component.
  late ChatbubblesModel chatbubblesModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    chatbubblesModel = createModel(context, () => ChatbubblesModel());
  }

  @override
  void dispose() {
    chatbubblesModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
