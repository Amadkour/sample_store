part of 'contact_us_bloc.dart';

@immutable
abstract class ContactUsEvent {}
 class MessageTypeChange extends ContactUsEvent {}
 class ImageChange extends ContactUsEvent {}
 class MessageSend extends ContactUsEvent {}
 class MessageConfirm extends ContactUsEvent {}
