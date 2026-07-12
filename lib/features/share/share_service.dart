import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'share_card.dart';

/// Renders a [ShareCard] to a PNG and hands it to the OS share sheet.
///
/// The card is captured OFF-SCREEN: it's inserted into the root [Overlay] far
/// outside the viewport, painted for a frame, then read back via
/// [RenderRepaintBoundary.toImage] at the format's export pixel ratio. This
/// makes the output pixel size deterministic (1080×1920 / 1080×1080) regardless
/// of the physical device's screen density.
class ShareService {
  const ShareService._();

  /// Capture [format] and open the share sheet. Returns silently on success.
  static Future<void> shareVerse(
    BuildContext context, {
    required String reference,
    required String verseText,
    required ShareFormat format,
  }) async {
    final bytes = await capturePng(
      context,
      reference: reference,
      verseText: verseText,
      format: format,
    );

    final dir = await getTemporaryDirectory();
    final stamp = DateTime.now().millisecondsSinceEpoch;
    final file = File('${dir.path}/salita_${format.name}_$stamp.png');
    await file.writeAsBytes(bytes, flush: true);

    await Share.shareXFiles(
      [XFile(file.path, mimeType: 'image/png')],
      text: '$reference — Salita',
    );
  }

  /// Render the card to PNG bytes without sharing (useful for tests/preview).
  static Future<Uint8List> capturePng(
    BuildContext context, {
    required String reference,
    required String verseText,
    required ShareFormat format,
  }) async {
    // Ensure the serif/sans faces are loaded before capture so the exported
    // image never falls back to a system font. `pendingFonts` completes once
    // any fonts requested this session (incl. the two below) are ready.
    await GoogleFonts.pendingFonts([
      GoogleFonts.lora(),
      GoogleFonts.inter(),
    ]);

    final boundaryKey = GlobalKey();
    final completer = Completer<Uint8List>();
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (_) => Positioned(
        // Far off-screen: laid out and painted, but never visible.
        left: -10000,
        top: 0,
        child: Material(
          type: MaterialType.transparency,
          child: RepaintBoundary(
            key: boundaryKey,
            child: ShareCard(
              reference: reference,
              verseText: verseText,
              format: format,
            ),
          ),
        ),
      ),
    );

    final overlay = Overlay.of(context, rootOverlay: true);
    overlay.insert(entry);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        // One extra beat so the first paint (and any font swap) settles.
        await Future<void>.delayed(const Duration(milliseconds: 32));
        final boundary = boundaryKey.currentContext!.findRenderObject()
            as RenderRepaintBoundary;
        final image =
            await boundary.toImage(pixelRatio: format.exportPixelRatio);
        final data = await image.toByteData(format: ui.ImageByteFormat.png);
        image.dispose();
        if (data == null) {
          completer.completeError(StateError('Failed to encode share image'));
        } else {
          completer.complete(data.buffer.asUint8List());
        }
      } catch (e, st) {
        completer.completeError(e, st);
      } finally {
        entry.remove();
      }
    });

    return completer.future;
  }
}

/// Presents a bottom sheet with a live preview and Story/Feed export choices.
Future<void> showShareSheet(
  BuildContext context, {
  required String reference,
  required String verseText,
}) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (_) => _ShareSheet(
      reference: reference,
      verseText: verseText,
    ),
  );
}

class _ShareSheet extends StatefulWidget {
  const _ShareSheet({required this.reference, required this.verseText});

  final String reference;
  final String verseText;

  @override
  State<_ShareSheet> createState() => _ShareSheetState();
}

class _ShareSheetState extends State<_ShareSheet> {
  ShareFormat _format = ShareFormat.story;
  bool _busy = false;

  Future<void> _share() async {
    setState(() => _busy = true);
    try {
      await ShareService.shareVerse(
        context,
        reference: widget.reference,
        verseText: widget.verseText,
        format: _format,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hindi ma-share ang larawan: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Preview the true-size card scaled down to fit the sheet (FittedBox).
    const previewHeight = 320.0;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 4, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'I-share ang verse',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: previewHeight,
              child: FittedBox(
                child: ShareCard(
                  reference: widget.reference,
                  verseText: widget.verseText,
                  format: _format,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SegmentedButton<ShareFormat>(
              segments: const [
                ButtonSegment(
                  value: ShareFormat.story,
                  label: Text('Story'),
                  icon: Icon(Icons.crop_portrait),
                ),
                ButtonSegment(
                  value: ShareFormat.feed,
                  label: Text('Feed'),
                  icon: Icon(Icons.crop_square),
                ),
              ],
              selected: {_format},
              onSelectionChanged: (s) => setState(() => _format = s.first),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _busy ? null : _share,
                icon: _busy
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.ios_share),
                label: Text(_busy ? 'Ginagawa…' : 'I-share'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
