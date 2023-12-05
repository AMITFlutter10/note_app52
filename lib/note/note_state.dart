part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}
class InsertDataSuccess extends NoteState {}
class InsertDataError extends NoteState {}


class LoadingGetData extends NoteState {}
class GetDataSuccess extends NoteState {}
class GetDataError extends NoteState {}

class UpdateDataSuccess extends NoteState {}
class UpdateDataError extends NoteState {}
class DeleteDataSuccess extends NoteState {}
class DeleteDataError extends NoteState {}
