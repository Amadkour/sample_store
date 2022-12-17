part of 'contact_us_bloc.dart';

@immutable
abstract class ContactUsState {}

class ContactUsInitial extends ContactUsState {}
class MessageTypeChanged extends ContactUsState {}
class ImageChanged extends ContactUsState {}
class MessageSending extends ContactUsState {}
class MessageSent extends ContactUsState {}
