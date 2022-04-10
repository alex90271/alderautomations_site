import 'package:flutter/material.dart';
import 'nav_bar_item.dart';
import 'package:alderautomationsdotcom/globals.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  PageController pgctrl;
  NavigationBarTabletDesktop({Key? key, required this.pgctrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Align(
      alignment: FractionalOffset.topCenter,
      child: SizedBox(
        height: size.height * 0.055,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: [Image.asset(mainLogo), const Text(mainTitle)]),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  NavBarPage(
                    'Contact',
                    page: 4,
                    pgcntrl: pgctrl,
                  ),
                  NavBarPage('Solutions', page: 1, pgcntrl: pgctrl),
                  NavBarPage('Testimonials', page: 2, pgcntrl: pgctrl),
                  NavBarPage('About', page: 3, pgcntrl: pgctrl),
                  const NavBarLink(
                    'Github',
                    url: 'https://github.com/alex90271',
                  ),
                  const NavBarLink('LinkedIn',
                      url: 'https://www.linkedin.com/in/alex-alder/'),
                ],
              )
            ]),
      ),
    );
  }
}
