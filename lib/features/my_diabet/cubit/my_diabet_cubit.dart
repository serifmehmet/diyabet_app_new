import 'package:bloc/bloc.dart';
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

  MyDiabetCubit({required this.saveLocalUserIdfUseCase, required this.getAllUserIdfUseCase}) : super(MyDiabetInitial()) {
    getAllUserIdf();
  }

  List<UserIdf>? userIdfList = [];
  bool addIdfValueAndTime(TimeOfDay selectedHour, String idfValue) {
    try {
      //check if the hour is between any hour which added by the user
      final now = DateTime.now();
      if (userIdfList!.isEmpty) {
        var userIdfToAdd = UserIdf(
          id: UniqueKey().hashCode,
          idfValue: double.parse(idfValue),
          hour: DateTime(now.year, now.month, now.day, selectedHour.hour, selectedHour.minute),
          userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
        );

        saveLocalUserIdfUseCase.call(SaveLocalUserIdfParams(userIdf: userIdfToAdd));
        userIdfList!.add(userIdfToAdd);
        emit(MyDiabetIdfListGetSuccess(userIdfList: userIdfList!));
        return true;
      } else {
        int hourIsBeforeCount = 0;
        //Look in items saved before
        for (var element in userIdfList!) {
          var selectedDate = DateTime(now.year, now.month, now.day, selectedHour.hour, selectedHour.minute);
          var dateSavedBefore = DateTime(now.year, now.month, now.day, element.hour!.hour, element.hour!.minute);
          if (selectedDate.isBefore(dateSavedBefore)) {
            hourIsBeforeCount = hourIsBeforeCount + 1;
          } else if (selectedDate == dateSavedBefore) {
            emit(const MyDiabetValueAddedFailure(failureMessage: "Seçtiğiniz saat daha önce eklenmiş olmamalı"));
            emit(MyDiabetInitial());
            return false;
          }
        }

        if (hourIsBeforeCount > 0) {
          emit(const MyDiabetValueAddedFailure(failureMessage: "Daha önce eklenmiş bir saatten küçük saat seçemezsiniz."));
          emit(MyDiabetInitial());
          return false;
        } else {
          final now = DateTime.now();
          var userIdfToAdd = UserIdf(
            id: UniqueKey().hashCode,
            idfValue: double.parse(idfValue),
            hour: DateTime(now.year, now.month, now.day, selectedHour.hour, selectedHour.minute),
            userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
          );

          saveLocalUserIdfUseCase.call(SaveLocalUserIdfParams(userIdf: userIdfToAdd));
          userIdfList!.add(userIdfToAdd);
          emit(MyDiabetIdfListGetSuccess(userIdfList: userIdfList!));
          return true;
        }
      }
    } catch (e) {
      print(e.toString());
      emit(const MyDiabetValueAddedFailure(failureMessage: "Eklenirken bir hata oluştu"));
    }

    return false;
  }

  Future<void> getAllUserIdf() async {
    userIdfList = await getAllUserIdfUseCase.call(
      GetAllUserIdfUseCaseParams(
        userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
      ),
    );

    emit(MyDiabetIdfListGetSuccess(userIdfList: userIdfList!));
  }
}
