import 'package:flutter/material.dart';
import 'package:sac_app/admin/upload_event.dart';
import 'package:sac_app/admin/upload_results.dart';

import 'package:sac_app/screens/home_page.dart';
import 'package:sac_app/screens/results_page.dart';
import 'package:sac_app/admin/admin_login_page.dart';

List<Widget> homeScreenItems = [
  HomePage(),
  ResultsPage(),
  const AdminLoginScreen(),
];

List<Widget> adminPageItems = [
  const UploadEvent(),
  const UpoaldResults(),
];

List<String> items = [
  'All',
  'Cricket',
  'Football',
  'Volleyball',
  'Basketball',
  'Atheletics',
  'Weightlifting'
];

// List<String> teams = ['CSE', 'ECE', 'EE', 'ME', 'CE', 'ARCH'];

// List<String> date = ['All', 'Today', 'Upcoming', 'Past'];
