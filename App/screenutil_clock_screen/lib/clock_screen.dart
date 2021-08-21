import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 300),
          Center(
            child: CustomPaint(
              painter: MyTextPainter(text: date.hour),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 65.0, top: 35.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                date.minute.toString().padLeft(2, '0'),
                style: GoogleFonts.lato().copyWith(fontSize: 50),
              ),
            ),
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const IconButton(
                icon: Icon(Icons.mail_rounded),
                onPressed: null,
              ),
              const IconButton(
                icon: Icon(Icons.map_rounded),
                onPressed: null,
              ),
              const IconButton(
                icon: Icon(Icons.music_note_rounded),
                onPressed: null,
              ),
              const IconButton(
                icon: Icon(Icons.sms_rounded),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                days[date.weekday].toUpperCase(),
                style: GoogleFonts.robotoCondensed().copyWith(
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${months[date.month].toUpperCase()}-${date.day.toString()}',
                style: GoogleFonts.robotoCondensed().copyWith(
                  fontSize: 20,
                ),
              )
            ],
          ),
          Text(
            'CLOUDY 26°C',
            style: GoogleFonts.robotoCondensed().copyWith(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 80,
          )
        ],
      ),
    );
  }
}

class MyTextPainter extends CustomPainter {
  MyTextPainter({required this.text});

  final int text;

  @override
  void paint(Canvas canvas, Size size) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text > 12 ? (text - 12).toString() : text.toString(),
        style: GoogleFonts.lato().copyWith(
          fontSize: 200.0,
          fontWeight: FontWeight.w200,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    // Draw text
    final textOffset =
        size.center(Offset.zero) - textPainter.size.center(Offset.zero);

    // Your text box (orange in your example)
    final boxRect = RRect.fromRectAndCorners(Rect.largest);
    final boxPaint = Paint()
      ..color = Colors.white
      ..blendMode = BlendMode.srcOut;

    canvas.saveLayer(boxRect.outerRect, Paint());
    textPainter.paint(canvas, textOffset);
    canvas.drawRRect(boxRect, boxPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(MyTextPainter oldDelegate) => true;
}
