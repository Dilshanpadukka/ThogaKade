import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class Report {
  final String reportID;
  final DateTime generatedDate;
  final Map<String, dynamic> summary;

  Report({
    String? reportID,
    DateTime? generatedDate,
    required this.summary,
  }) : 
    reportID = reportID ?? const Uuid().v4(),
    generatedDate = generatedDate ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'reportID': reportID,
      'generatedDate': generatedDate.toIso8601String(),
      'summary': summary,
    };
  }

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      reportID: json['reportID'],
      generatedDate: DateTime.parse(json['generatedDate']),
      summary: Map<String, dynamic>.from(json['summary']),
    );
  }

  @override
  String toString() {
    return 'Report{id: $reportID, date: $generatedDate, summary: $summary}';
  }
}