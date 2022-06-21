import 'package:bloc/bloc.dart';
import 'package:diyabet_app/domain/usecases/user_idf/delete_single_user_idf_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_idf/params/delete_user_idf_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/enums/preferences_keys.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../domain/entities/user_idf.dart';
import '../../../domain/usecases/user_idf/get_all_user_idf_usecase.dart';
import '../../../domain/usecases/user_idf/params/get_all_user_idf_usecase_params.dart';
import '../../../domain/usecases/user_idf/params/save_local_user_idf_params.dart';
import '../../../domain/usecases/user_idf/save_user_idf_usecase.dart';

part 'my_diabet_state.dart';

class MyDiabetCubit extends Cubit<MyDiabetState> {
  final SaveLocalUserIdfUseCase saveLocalUserIdfUseCase;
  final GetAllUserIdfUseCase getAllUserIdfUseCase;
  final DeleteSingleUserIdfUseCase deleteSingleUserIdfUseCase;

  MyDiabetCubit({required this.saveLocalUserIdfUseCase, required this.getAllUserIdfUseCase, required this.deleteSingleUserIdfUseCase})
      : super(MyDiabetInitial()) {
    getAllUserIdf();
  }

  List<UserIdf>? userIdfList = [];
  bool addIdfValueAndTime(TimeOfDay selectedHour, String idfValue) {
    try {
      //check if the hour is between any hour which added by the user
      if (userIdfList!.isEmpty) {
        var userIdfToAdd = UserIdf(
          id: UniqueKey().hashCode,
          idfValue: double.parse(idfValue),
          hour: DateTime(2022, 01, 01, selectedHour.hour, selectedHour.minute),
          userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
        );

        saveLocalUserIdfUseCase.call(SaveLocalUserIdfParams(userIdf: userIdfToAdd));
        userIdfList!.add(userIdfToAdd);
        userIdfList!.sort(((a, b) => a.hour!.compareTo(b.hour!)));
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

          saveLocalUserIdfUseCase.call(SaveLocalUserIdfParams(userIdf: userIdfToAdd));
          userIdfList!.add(userIdfToAdd);
          userIdfList!.sort(((a, b) => a.hour!.compareTo(b.hour!)));
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
    userIdfList!.sort(((a, b) => a.hour!.compareTo(b.hour!)));

    getAllUserIdf();
  }

  Future<void> getAllUserIdf() async {
    userIdfList = await getAllUserIdfUseCase.call(
      GetAllUserIdfUseCaseParams(
        userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
      ),
    );
    userIdfList!.sort(((a, b) => a.hour!.compareTo(b.hour!)));
    emit(
      MyDiabetIdfListGetSuccess(userIdfList: userIdfList!),
    );
  }
}
