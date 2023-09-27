import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int? countTeamMembers(List<String>? membersList) {
  // count array lenth
  if (membersList == null) {
    return null;
  } else {
    return membersList.length;
  }
}

bool? checkIfListContainValue(
  DocumentReference? sercheblValue,
  List<DocumentReference>? listForSearch,
) {
  // check if list contain sercheblValue
  if (sercheblValue == null || listForSearch == null) {
    return null;
  }
  return listForSearch.contains(sercheblValue);
}

int? stringToInt(String? inputDataSTRING) {
  // convert string inputDataSTRING to integer output
  if (inputDataSTRING == null) {
    return null;
  }
  final parsedInt = int.tryParse(inputDataSTRING);
  if (parsedInt == null) {
    return null;
  }
  return parsedInt;
}
