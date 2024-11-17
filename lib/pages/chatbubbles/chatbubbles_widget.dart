import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chatbubbles_model.dart';
export 'chatbubbles_model.dart';

class ChatbubblesWidget extends StatefulWidget {
  const ChatbubblesWidget({
    super.key,
    String? role,
  }) : this.role = role ?? 'bot';

  final String role;

  @override
  State<ChatbubblesWidget> createState() => _ChatbubblesWidgetState();
}

class _ChatbubblesWidgetState extends State<ChatbubblesWidget> {
  late ChatbubblesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatbubblesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.98, -0.05),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Image.network(
                    'https://picsum.photos/seed/146/600',
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (widget!.role == 'bot')
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.assistant_rounded,
                    color: FlutterFlowTheme.of(context).secondary,
                    size: 50.0,
                  ),
                ),
              ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            'Hello, How can I help you today?',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
