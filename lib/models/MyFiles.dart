import 'package:testapp/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title;
  final int? numOfFiles, percentage, totalStorage;
  final Color? color;
  final IconData iconData;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
    this.iconData = Icons.cloud_download_outlined
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Sales Today",
    numOfFiles: 5034,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: 10000,
    color: primaryColor,
    percentage: (5034/10000*100).round(),
    iconData: Icons.functions_outlined
  ),
  CloudStorageInfo(
    title: "Inventory Stock",
    numOfFiles: 1328,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: 5000,
    color: Color(0xFFFFA113),
    percentage: (1328/5000*100).round(),
    iconData: Icons.inventory_2_outlined
  ),
  CloudStorageInfo(
    title: "This Week Target",
    numOfFiles: 22964,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: 90000,
    color: Color(0xFFA4CDFF),
    percentage: (22964/90000*100).round(),
    iconData: Icons.hourglass_empty_outlined
  ),
  CloudStorageInfo(
    title: "Expired",
    numOfFiles: 103,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: 3000,
    color: Color(0xFF007EE5),
    percentage: (103/3000*100).round(),
    iconData: Icons.cloud_off_outlined
  ),
];
