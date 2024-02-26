class VisitModel {
  List<Data>? data;
  String? message;

  VisitModel({this.data, this.message});

  VisitModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? sId;
  String? dateStart;
  String? dateEnd;
  ServerId? serverId;
  String? visitType;
  String? visitTypeSource;
  String? npi1;
  dynamic npi2;
  Resources? resources;
  List<NewDocs>? newDocs;
  List<dynamic>? tasksForUser;
  List<String>? instructionsForUser;
  String? longSummary;
  String? shortSummary;
  String? doctorSummary;
  List<ValidatedTasksForUser>? validatedTasksForUser;
  List<String>? validatedInstructionsForUser;
  String? validatedLongSummary;
  String? validatedShortSummary;
  String? validatedDoctorSummary;

  Data(
      {this.sId,
        this.dateStart,
        this.dateEnd,
        this.serverId,
        this.visitType,
        this.visitTypeSource,
        this.npi1,
        this.npi2,
        this.resources,
        this.newDocs,
        this.tasksForUser,
        this.instructionsForUser,
        this.longSummary,
        this.shortSummary,
        this.doctorSummary,
        this.validatedTasksForUser,
        this.validatedInstructionsForUser,
        this.validatedLongSummary,
        this.validatedShortSummary,
        this.validatedDoctorSummary});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    dateStart = json['dateStart'];
    dateEnd = json['dateEnd'];
    serverId = json['serverId'] != null
        ? ServerId.fromJson(json['serverId'])
        : null;
    visitType = json['visitType'];
    visitTypeSource = json['visitTypeSource'];
    npi1 = json['npi1'];
    npi2 = json['npi2'];
    resources = json['resources'] != null
        ? Resources.fromJson(json['resources'])
        : null;
    if (json['newDocs'] != null) {
      newDocs = <NewDocs>[];
      json['newDocs'].forEach((v) {
        newDocs!.add(NewDocs.fromJson(v));
      });
    }
    tasksForUser = json['tasksForUser'];
    instructionsForUser = json['instructionsForUser']?.cast<String>();
    longSummary = json['longSummary'];
    shortSummary = json['shortSummary'];
    doctorSummary = json['doctorSummary'];
    if (json['validatedTasksForUser'] != null) {
      validatedTasksForUser = <ValidatedTasksForUser>[];
      json['validatedTasksForUser'].forEach((v) {
        validatedTasksForUser!.add(ValidatedTasksForUser.fromJson(v));
      });
    }
    validatedInstructionsForUser =
        json['validatedInstructionsForUser']?.cast<String>();
    validatedLongSummary = json['validatedLongSummary'];
    validatedShortSummary = json['validatedShortSummary'];
    validatedDoctorSummary = json['validatedDoctorSummary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['dateStart'] = dateStart;
    data['dateEnd'] = dateEnd;
    if (serverId != null) {
      data['serverId'] = serverId!.toJson();
    }
    data['visitType'] = visitType;
    data['visitTypeSource'] = visitTypeSource;
    data['npi1'] = npi1;
    data['npi2'] = npi2;
    if (resources != null) {
      data['resources'] = resources!.toJson();
    }
    if (newDocs != null) {
      data['newDocs'] = newDocs!.map((v) => v.toJson()).toList();
    }
    data['tasksForUser'] = tasksForUser;
    data['instructionsForUser'] = instructionsForUser;
    data['longSummary'] = longSummary;
    data['shortSummary'] = shortSummary;
    data['doctorSummary'] = doctorSummary;
    if (validatedTasksForUser != null) {
      data['validatedTasksForUser'] =
          validatedTasksForUser!.map((v) => v.toJson()).toList();
    }
    data['validatedInstructionsForUser'] = validatedInstructionsForUser;
    data['validatedLongSummary'] = validatedLongSummary;
    data['validatedShortSummary'] = validatedShortSummary;
    data['validatedDoctorSummary'] = validatedDoctorSummary;
    return data;
  }
}

class ServerId {
  String? emr;
  String? payer;

  ServerId({this.emr, this.payer});

  ServerId.fromJson(Map<String, dynamic> json) {
    emr = json['emr'];
    payer = json['payer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['emr'] = emr;
    data['payer'] = payer;
    return data;
  }
}

class Resources {
  List<String>? encounter;
  List<String>? condition;
  List<String>? medicationRequest;
  List<String>? diagnosticReport;
  List<String>? documentReference;

  Resources(
      {this.encounter,
        this.condition,
        this.medicationRequest,
        this.diagnosticReport,
        this.documentReference});

  Resources.fromJson(Map<String, dynamic> json) {
    encounter = json['Encounter']?.cast<String>();
    condition = json['Condition']?.cast<String>();
    medicationRequest = json['MedicationRequest']?.cast<String>();
    diagnosticReport = json['DiagnosticReport']?.cast<String>();
    documentReference = json['DocumentReference']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Encounter'] = encounter;
    data['Condition'] = condition;
    data['MedicationRequest'] = medicationRequest;
    data['DiagnosticReport'] = diagnosticReport;
    data['DocumentReference'] = documentReference;
    return data;
  }
}

class NewDocs {
  String? resourceType;
  String? practitioner;
  dynamic location;
  String? startDate;
  String? endDate;
  String? type;
  String? lastUpdated;
  String? verificationStatus;
  String? display;
  String? category;
  String? data;

  NewDocs(
      {this.resourceType,
        this.practitioner,
        this.location,
        this.startDate,
        this.endDate,
        this.type,
        this.lastUpdated,
        this.verificationStatus,
        this.display,
        this.category,
        this.data});

  NewDocs.fromJson(Map<String, dynamic> json) {
    resourceType = json['resourceType'];
    practitioner = json['practitioner'];
    location = json['location'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    type = json['type'];
    lastUpdated = json['lastUpdated'];
    verificationStatus = json['verificationStatus'];
    display = json['display'];
    category = json['category'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resourceType'] = resourceType;
    data['practitioner'] = practitioner;
    data['location'] = location;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['type'] = type;
    data['lastUpdated'] = lastUpdated;
    data['verificationStatus'] = verificationStatus;
    data['display'] = display;
    data['category'] = category;
    data['data'] = this.data;
    return data;
  }
}

class ValidatedTasksForUser {
  String? id;
  String? task;
  String? status;
  String? note;

  ValidatedTasksForUser({this.id, this.task, this.status, this.note});

  ValidatedTasksForUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    task = json['task'];
    status = json['status'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task'] = task;
    data['status'] = status;
    data['note'] = note;
    return data;
  }
}
