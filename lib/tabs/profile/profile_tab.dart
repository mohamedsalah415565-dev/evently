import 'package:evently_app/app_theme.dart';
import 'package:evently_app/models/language_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundImage: AssetImage('assets/images/route_logo.png'),
          ),
          SizedBox(height: 16),
          Text(
            'User Name',
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 16),
          Text('Useremail@gmail.com', style: textTheme.titleSmall),
          SizedBox(height: 32),
          SwitchListTile(
            onChanged: (value) {},
            value: false,
            title: Text('Dark Mode'),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),

            activeTrackColor: Theme.of(context).primaryColor,
            inactiveThumbColor: Theme.of(context).primaryColor,
            thumbColor: WidgetStatePropertyAll(AppTheme.white),
            trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text('Language'),
            trailing: DropdownButton(
              value: 'en',
              items: LanguageModel.languages
                  .map(
                    (language) => DropdownMenuItem(
                      value: language.code,
                      child: Text(language.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
              dropdownColor: AppTheme.white,
              borderRadius: BorderRadius.circular(16),
              underline: SizedBox(),
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            title: Text('Logout', style: textTheme.titleMedium),
            trailing: SvgPicture.asset(
              'assets/icons/logout.svg',
              height: 24,
              width: 24,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
