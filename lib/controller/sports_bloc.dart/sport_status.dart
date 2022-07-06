abstract class SportStatus {}

class SportInitialStatus extends SportStatus {}

class SportGetSucessStatus extends SportStatus {}

class SportGetErrorStatus extends SportStatus {
  String? error;

  SportGetErrorStatus(this.error);
}
