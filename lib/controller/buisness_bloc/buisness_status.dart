abstract class BuisnessStatus {}

class BuisnessInitialStatus extends BuisnessStatus {}

class GetBuisnessScucessStatus extends BuisnessStatus {}

class GetBuisnessErrorState extends BuisnessStatus {
  String? error;
  GetBuisnessErrorState(this.error);
}
