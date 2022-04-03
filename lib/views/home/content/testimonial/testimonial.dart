import '/widgets/testimonial_box/testimonial_box.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '/widgets/centerted_view/centerted_view.dart';

final List<Widget> testimonialList = [
  const TestimonialBox(
      title: 'Testimonial One', desc: 'Testimonial Content One'),
  const TestimonialBox(
      title: 'Testimonial Two', desc: 'Testimonial Content Two'),
  const TestimonialBox(
      title: 'Testimonial Three', desc: 'Testimonial Content Three'),
  const TestimonialBox(
      title: 'Testimonial Four', desc: 'Testimonial Content Four'),
  const TestimonialBox(
      title: 'Testimonial Five', desc: 'Testimonial Content Five')
];

class TestimonialView extends StatelessWidget {
  const TestimonialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.85,
      child: CenteredView(
        child: CarouselSlider(
          items: testimonialList,
          options: CarouselOptions(
              enableInfiniteScroll: true,
              initialPage: 2,
              autoPlay: true,
              viewportFraction: 0.4),
        ),
      ),
    );
  }
}