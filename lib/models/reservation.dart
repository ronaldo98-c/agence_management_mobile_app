class Reservation {
  int reservationId;
  String state;
  String reference;
  double totalAmount;
  String paymentStatus;
  String paymentMethod;
  String createdAt;

  Reservation(
     this.reservationId, this.state, this.reference, this.totalAmount, this.paymentStatus, this.paymentMethod, this.createdAt);
}