import 'package:flutter/material.dart';
import 'package:razorpay_user/Helpers/buttons.dart';
import 'package:razorpay_user/Helpers/colors.dart';
import 'package:razorpay_user/Helpers/custom_icons.dart';
import 'package:razorpay_user/Helpers/style.dart';
import 'package:razorpay_user/Helpers/textfield_decoration.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
      ),
      children: [
        Text(
          'Your Profile',
          style: greenBoldText.copyWith(
            fontSize: width * 0.0475,
          ),
          textAlign: TextAlign.center,
        ),
        Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CustomIcons.edit,
                  color: green,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: width * 0.43,
              width: width * 0.43,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://www.wallpapertip.com/wmimgs/159-1592363_full-hd-girls-hd.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: width * 0.03),
              child: InkWell(
                onTap: () {},
                child: const Text(
                  'Change Profile',
                ),
              ),
            ),
            SizedBox(height: width * 0.03),
            const Text(
              'My Referral Code : ABCDEF',
              style: greenText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: width * 0.07),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
              ),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: TextFieldDecoration.rRectDecoration(
                        label: 'Name',
                        width: width,
                      ),
                      initialValue: 'Jose',
                      readOnly: true,
                    ),
                    SizedBox(height: width * 0.06),
                    TextFormField(
                      decoration: TextFieldDecoration.rRectDecoration(
                        label: 'Phone No.',
                        width: width,
                      ),
                      initialValue: '+91 9876556344',
                      readOnly: true,
                    ),
                    SizedBox(height: width * 0.06),
                    TextFormField(
                      decoration: TextFieldDecoration.rRectDecoration(
                        label: 'Address',
                        width: width,
                      ),
                      initialValue:
                          'AMC Enclave, No. 6, Third Cross Street, Sterling Road',
                      readOnly: true,
                    ),
                    SizedBox(height: width * 0.03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
