abstract class ScienceStatus {}

class ScienceInitialStatus extends ScienceStatus {}

class ScienceGetSucessStatus extends ScienceStatus {}

class ScienceErrorGetStatus extends ScienceStatus {
  String? error;
  ScienceErrorGetStatus(this.error);
}
