import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/translation.dart';
import '../../../data/db/database.dart';

/// The screenshot-worthy verse hero used on the Today screen.
///
/// Warm gradient, serif verse face, subtle branding. Respects the user's
/// translation preference (Tagalog / English / both). Tapping is handled by
/// the parent (opens the Reflection page).
class VerseCard extends StatelessWidget {
  const VerseCard({
    super.key,
    required this.verse,
    required this.translation,
    this.onTap,
  });

  final Verse verse;
  final TranslationPref translation;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: SalitaColors.sunriseGradient,
            ),
            boxShadow: [
              BoxShadow(
                color: SalitaColors.deepNavy.withValues(alpha: 0.12),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 32, 28, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  verse.referenceDisplay.toUpperCase(),
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                    color: SalitaColors.deepNavy.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 18),
                if (translation.showTagalog)
                  Text(
                    verse.textTl,
                    style: GoogleFonts.lora(
                      fontSize: 22,
                      height: 1.45,
                      fontWeight: FontWeight.w500,
                      color: SalitaColors.deepNavy,
                    ),
                  ),
                if (translation == TranslationPref.both)
                  const SizedBox(height: 14),
                if (translation.showEnglish)
                  Text(
                    verse.textEn,
                    style: GoogleFonts.lora(
                      fontSize: translation == TranslationPref.both ? 17 : 22,
                      height: 1.45,
                      fontStyle: translation == TranslationPref.both
                          ? FontStyle.italic
                          : FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: SalitaColors.deepNavy
                          .withValues(alpha: translation.showTagalog ? 0.75 : 1),
                    ),
                  ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.auto_stories_outlined,
                          size: 15,
                          color: SalitaColors.deepNavy.withValues(alpha: 0.7),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Salita',
                          style: GoogleFonts.lora(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: SalitaColors.deepNavy.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                    if (onTap != null)
                      Row(
                        children: [
                          Text(
                            'Basahin ang paliwanag',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: SalitaColors.deepNavy
                                  .withValues(alpha: 0.7),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: SalitaColors.deepNavy.withValues(alpha: 0.7),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
