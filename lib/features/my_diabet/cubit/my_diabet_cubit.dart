import 'package:bloc/bloc.dart';
import 'package:diyabet_app/domain/usecases/user_idf/local/delete_single_user_idf_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_idf/params/delete_user_idf_params.dart';
import 'package:diyabet_app/domain/usecases/user_idf/remote/delete_remote_useridf_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_idf/remote/save_remote_useridf_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/enums/preferences_keys.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../domain/entities/user_idf.dart';
import '../../../domain/usecases/user_idf/local/get_all_user_idf_usecase.dart';
import '../../../domain/usecases/user_idf/params/get_all_user_idf_usecase_params.dart';
import '../../../domain/usecases/user_idf/params/save_user_idf_params.dart';
import '../../../domain/usecases/user_idf/local/save_user_idf_usecase.dart';

part 'my_diabet_state.dart';

class MyDiabetCubit extends Cubit<MyDiabetState> {
  final SaveLocalUserIdfUseCase saveLocalUserIdfUseCase;
  final GetAllUserIdfUseCase getAllUserIdfUseCase;
  final DeleteSingleUserIdfUseCase deleteSingleUserIdfUseCase;

  final SaveRemoteUserIdf saveRemoteUserIdf;
  final DeleteRemoteUserIdfUseCase deleteRemoteUserIdfUseCase;

  MyDiabetCubit({
    required this.saveLocalUserIdfUseCase,
    required this.getAllUserIdfUseCase,
    required this.deleteSingleUserIdfUseCase,
    required this.saveRemoteUserIdf,
    required this.deleteRemoteUserIdfUseCase,
  }) : super(MyDiabetInitial()) {
    getAllUserIdf();
  }

  List<UserIdf>? userIdfList = [];
  //List<UserIko>? userIkoList = [];
  bool addIdfValueAndTime(TimeOfDay selectedHour, String idfValue) {
    emit(MyDiabetValueAdding());
    try {
      //check if the hour is between any hour which added by the user
      if (userIdfList!.isEmpty) {
        var userIdfToAdd = UserIdf(
          id: UniqueKey().hashCode,
          idfValue: double.parse(idfValue),
          hour: DateTime(2022, 01, 01, selectedHour.hour, selectedHour.minute),
          userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
        );

        saveLocalUserIdfUseCase.call(SaveUserIdfParams(userIdf: userIdfToAdd));
        userIdfList!.add(userIdfToAdd);
        userIdfList!.sort(((a, b) => a.hour!.compareTo(b.hour!)));
        //remoteSave
        saveRemoteUserIdf.call(SaveUserIdfParams(userIdf: userIdfToAdd));

        emit(MyDiabetIdfListGetSuccess(userIdfList: userIdfList!));
        return true;
      } else {
        //Look in items saved before
        int matchedHourCount = 0;
        for (var element in userIdfList!) {
          var selectedDate = DateTime(2022, 01, 01, selectedHour.hour, selectedHour.minute);
          var dateSavedBefore = DateTime(2022, 01, 01, element.hour!.hour, element.hour!.minute);
          //Is the hour added before control
          if (selectedDate == dateSavedBefore) {
            matchedHourCount = matchedHourCount + 1;
          }
        }

        if (matchedHourCount == 0) {
          var userIdfToAdd = UserIdf(
            id: UniqueKey().hashCode,
            idfValue: double.parse(idfValue),
            hour: DateTime(2022, 01, 01, selectedHour.hour, selectedHour.minute),
            userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
          );

          saveLocalUserIdfUseCase.call(SaveUserIdfParams(userIdf: userIdfToAdd));
          userIdfList!.add(userIdfToAdd);
          userIdfList!.sort(((a, b) => a.hour!.compareTo(b.hour!)));

          //remoteSave
          saveRemoteUserIdf.call(SaveUserIdfParams(userIdf: userIdfToAdd));
          emit(MyDiabetIdfListGetSuccess(userIdfList: userIdfList!));

          return true;
        } else {
          emit(const MyDiabetValueAddedFailure(failureMessage: "Seçtiğiniz saat daha önce eklenmiş olmamalı"));
          getAllUserIdf();
          return false;
        }
      }
    } catch (e) {
      print(e.toString());
      emit(const MyDiabetValueAddedFailure(failureMessage: "Eklenirken bir hata oluştu"));
    }

    return true;
  }

  Future<void> deleteUserIdfItem(int userIdfId) async {
    await deleteSingleUserIdfUseCase.call(DeleteUserIdfParams(userIdfId: userIdfId));

    userIdfList!.removeWhere((element) => element.id == userIdfId);
    if (userIdfList!.isNotEmpty) {
      userIdfList!.sort(((a, b) => a.hour!.compareTo(b.hour!)));
    }

    await deleteRemoteUserIdfUseCase.call(DeleteUserIdfParams(userIdfId: userIdfId));

    getAllUserIdf();
  }

  Future<void> getAllUserIdf() async {
    try {
      userIdfList = await getAllUserIdfUseCase.call(
        GetAllUserIdfUseCaseParams(
          userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
        ),
      );
      if (userIdfList!.isNotEmpty) {
        userIdfList!.sort(((a, b) => a.hour!.compareTo(b.hour!)));
        emit(MyDiabetIdfListGetSuccess(userIdfList: userIdfList!));
      } else {
        emit(MyDiabetEmptyIdf());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
