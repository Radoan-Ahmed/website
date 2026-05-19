import 'dart:ui_web' as ui;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';

/// Embeds a Google Maps iframe for the given [lat]/[lng].
/// Uses the free Google Maps embed URL — no API key required.
///
/// [viewId] must be unique per instance on the page so Flutter can
/// register separate platform view factories.
class MapIframeWidget extends StatefulWidget {
  final double lat;
  final double lng;
  final int zoom;
  final String viewId;

  const MapIframeWidget({
    super.key,
    required this.lat,
    required this.lng,
    required this.viewId,
    this.zoom = 17,
  });

  @override
  State<MapIframeWidget> createState() => _MapIframeWidgetState();
}

class _MapIframeWidgetState extends State<MapIframeWidget> {
  late final String _viewType;

  @override
  void initState() {
    super.initState();
    _viewType = 'google-map-${widget.viewId}';
    // Build the embed URL from the coordinates in app_content.dart
    final src = 'https://maps.google.com/maps'
        '?q=${widget.lat},${widget.lng}'
        '&z=${widget.zoom}'
        '&output=embed';

    ui.platformViewRegistry.registerViewFactory(_viewType, (int id) {
      return html.IFrameElement()
        ..src = src
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..allowFullscreen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewType);
  }
}
