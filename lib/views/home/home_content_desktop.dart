import 'package:alderautomationsdotcom/widgets/call_to_action/call_to_action.dart';
import 'package:alderautomationsdotcom/widgets/centerted_view/centerted_view.dart';
import 'package:alderautomationsdotcom/widgets/course_details/course_details.dart';
import 'package:alderautomationsdotcom/widgets/footer/footer.dart';
import 'package:flutter/material.dart';
import 'content/about/about.dart';
import 'content/contact/contact.dart';
import 'content/projects/projects.dart';
import 'content/testimonial/testimonial.dart';

class HomeContentDesktop extends StatelessWidget {
  final callToAction;
  final courseDetails;
  const HomeContentDesktop(
      {Key? key, required this.callToAction, required this.courseDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        CenteredView(
          child: Row(
            children: [
              CourseDetails(mainDesc: courseDetails),
              Center(
                  child: CallToAction(
                title_one: callToAction,
                title_two: 'About',
              )),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.35),
        const ProjectsView(),
        const TestimonialView(),
        const AboutView(),
        const ContactView(),
        const Footer()
      ],
    );
  }
}
