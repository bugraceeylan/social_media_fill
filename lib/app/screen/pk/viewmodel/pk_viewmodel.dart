import 'package:mobx/mobx.dart';
part 'pk_viewmodel.g.dart';

class PKViewModel = _PKViewModelBase with _$PKViewModel;

abstract class _PKViewModelBase with Store {}
