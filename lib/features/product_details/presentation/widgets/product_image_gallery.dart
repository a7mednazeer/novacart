import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/shimmer_box.dart';

class ProductImageGallery extends StatefulWidget {
  const ProductImageGallery({
    super.key,
    required this.images,
    required this.heroTag,
  });

  final List<String> images;
  final String heroTag;

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openZoomViewer(int initialIndex) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _ZoomGalleryScreen(
          images: widget.images,
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.images.isEmpty ? [''] : widget.images;

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (context, index) {
              final image = images[index];
              final child = image.isEmpty
                  ? Container(color: AppColors.shimmerBaseLight)
                  : CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const ShimmerBox(borderRadius: 0),
                    );

              return GestureDetector(
                onTap: () => _openZoomViewer(index),
                child: index == 0
                    ? Hero(tag: widget.heroTag, child: child)
                    : child,
              );
            },
          ),
        ),
        if (images.length > 1) ...[
          const SizedBox(height: 10),
          SmoothPageIndicator(
            controller: _controller,
            count: images.length,
            effect: const WormEffect(
              activeDotColor: AppColors.primary,
              dotColor: AppColors.borderLight,
              dotHeight: 6,
              dotWidth: 6,
            ),
          ),
        ],
      ],
    );
  }
}

/// Full-screen pinch-to-zoom viewer, opened by tapping any gallery
/// image. Uses `photo_view`'s gallery variant so the user can also
/// swipe between images while zoomed out.
class _ZoomGalleryScreen extends StatelessWidget {
  const _ZoomGalleryScreen({required this.images, required this.initialIndex});

  final List<String> images;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: PhotoViewGallery.builder(
        itemCount: images.length,
        pageController: PageController(initialPage: initialIndex),
        builder: (context, index) => PhotoViewGalleryPageOptions(
          imageProvider: CachedNetworkImageProvider(images[index]),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 3,
          heroAttributes: PhotoViewHeroAttributes(tag: 'zoom-$index'),
        ),
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        loadingBuilder: (context, event) => const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
