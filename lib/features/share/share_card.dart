import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_theme.dart';

/// Export formats for share images.
enum ShareFormat {
  /// Instagram/Facebook Story — 1080 × 1920 (9:16).
  story(logicalWidth: 360, logicalHeight: 640, exportPixelRatio: 3.0),

  /// Feed post — 1080 × 1080 (1:1).
  feed(logicalWidth: 360, logicalHeight: 360, exportPixelRatio: 3.0);

  const ShareFormat({
    required this.logicalWidth,
    required this.logicalHeight,
    required this.exportPixelRatio,
  });

  final double logicalWidth;
  final double logicalHeight;

  /// Capturing the [logicalWidth]×[logicalHeight] card at this ratio yields the
  /// exact target pixel size (e.g. 360×640 @ 3.0 → 1080×1920), independent of
  /// the device's own screen density.
  final double exportPixelRatio;

  Size get pixelSize =>
      Size(logicalWidth * exportPixelRatio, logicalHeight * exportPixelRatio);
}

/// The organic-growth engine: a beautiful verse card rendered to PNG for
/// sharing to FB/IG. Uses the Sunrise gradient + serif verse face and carries
/// a subtle "Salita" watermark. Text-only, public-domain scripture.
///
/// This widget renders at a fixed logical size ([ShareFormat]); it is captured
/// off-screen by [ShareService], so it must not depend on the surrounding
/// theme or `MediaQuery`.
class ShareCard extends StatelessWidget {
  const ShareCard({
    super.key,
    required this.reference,
    required this.verseText,
    required this.format,
  });

  final String reference;
  final String verseText;
  final ShareFormat format;

  @override
  Widget build(BuildContext context) {
    final isStory = format == ShareFormat.story;
    // Scale type roughly with the card so both formats read well.
    final verseSize = isStory ? 26.0 : 22.0;

    return SizedBox(
      width: format.logicalWidth,
      height: format.logicalHeight,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: SalitaColors.sunriseGradient,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(isStory ? 36 : 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              // Opening quote flourish.
              Text(
                '“',
                style: GoogleFonts.lora(
                  fontSize: isStory ? 72 : 56,
                  height: 0.8,
                  color: SalitaColors.deepNavy.withValues(alpha: 0.28),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: isStory ? 4 : 2),
              Flexible(
                child: Text(
                  verseText,
                  style: GoogleFonts.lora(
                    fontSize: verseSize,
                    height: 1.4,
                    color: SalitaColors.deepNavy,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: isStory ? 20 : 14),
              Text(
                reference,
                style: GoogleFonts.inter(
                  fontSize: isStory ? 16 : 14,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                  color: SalitaColors.deepNavy.withValues(alpha: 0.85),
                ),
              ),
              const Spacer(),
              _Watermark(compact: !isStory),
            ],
          ),
        ),
      ),
    );
  }
}

class _Watermark extends StatelessWidget {
  const _Watermark({required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.auto_stories_outlined,
          size: compact ? 14 : 16,
          color: SalitaColors.deepNavy.withValues(alpha: 0.75),
        ),
        const SizedBox(width: 6),
        Text(
          'Salita',
          style: GoogleFonts.lora(
            fontSize: compact ? 15 : 17,
            fontWeight: FontWeight.w600,
            color: SalitaColors.deepNavy.withValues(alpha: 0.85),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '·  araw-araw na salita',
          style: GoogleFonts.inter(
            fontSize: compact ? 10 : 11,
            color: SalitaColors.deepNavy.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
