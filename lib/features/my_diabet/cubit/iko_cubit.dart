import 'package:bloc/bloc.dart';
import 'package:diyabet_app/domain/usecases/user_iko/remote/delete_remote_useriko_usecase.dart';
import 'package:diyabet_app/domain/usecases/user_iko/remote/save_remote_useriko_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/enums/preferences_keys.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../domain/entities/user_iko.dart';
import '../../../domain/usecases/user_iko/local/delete_single_user_iko_usecase.dart';
import '../../../domain/usecases/user_iko/local/get_all_user_iko_list_usecase.dart';
import '../../../domain/usecases/user_iko/params/delete_user_iko_params.dart';
import '../../../domain/usecases/user_iko/params/get_all_user_iko_params.dart';
import '../../../domain/usecases/user_iko/params/save_user_iko_params.dart';
import '../../../domain/usecases/user_iko/local/save_local_user_iko_usecase.dart';

part 'iko_state.dart';

class IkoCubit extends Cubit<IkoState> {
  final GetAllUserIkoListUseCase getAllUserIkoListUseCase;
  final SaveLocalUserIkoUseCase saveLocalUserIkoUseCase;
  final DeleteSingleUserIkoUseCase deleteSingleUserIkoUseCase;

  final SaveRemoteUserIkoUseCase saveRemoteUserIkoUseCase;
  final DeleteRemoteUserIkoUseCase deleteRemoteUserIkoUseCase;

  IkoCubit({
    required this.getAllUserIkoListUseCase,
    required this.saveLocalUserIkoUseCase,
    required this.deleteSingleUserIkoUseCase,
    required this.saveRemoteUserIkoUseCase,
    required this.deleteRemoteUserIkoUseCase,
  }) : super(IkoCubitInitial());

  List<UserIko>? userIkoList = [];

  bool addIkoValueAndTime(TimeOfDay selectedHour, String ikoValue) {
    try {
      //check if the hour is between any hour which added by the user
      if (userIkoList!.isEmpty) {
        var userIkoToAdd = UserIko(
          id: UniqueKey().hashCode,
          ikoValue: double.parse(ikoValue),
          hour: DateTime(2022, 01, 01, selectedHour.hour, selectedHour.minute),
          userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
        );

        saveLocalUserIkoUseCase.call(SaveUserIkoParams(userIko: userIkoToAdd));
        userIkoList!.add(userIkoToAdd);
        userIkoList!.sort(((a, b) => a.hour!.compareTo(b.hour!)));
        //remoteSave
        saveRemoteUserIkoUseCase.call(SaveUserIkoParams(userIko: userIkoToAdd));

        emit(IkoListGetSuccess(userIkoList: userIkoList!));
        return true;
      } else {
        //Look in items saved before
        int matchedHourCount = 0;
        for (var element in userIkoList!) {
          var selectedDate = DateTime(2022, 01, 01, selectedHour.hour, selectedHour.minute);
          var dateSavedBefore = DateTime(2022, 01, 01, element.hour!.hour, element.hour!.minute);
          //Is the hour added before control
          if (selectedDate == dateSavedBefore) {
            matchedHourCount = matchedHourCount + 1;
          }
        }

        if (matchedHourCount == 0) {
          var userIkoToAdd = UserIko(
            id: UniqueKey().hashCode,
            ikoValue: double.parse(ikoValue),
            hour: DateTime(2022, 01, 01, selectedHour.hour, selectedHour.minute),
            userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
          );

          saveLocalUserIkoUseCase.call(SaveUserIkoParams(userIko: userIkoToAdd));
          userIkoList!.add(userIkoToAdd);
          userIkoList!.sort(((a, b) => a.hour!.compareTo(b.hour!)));

          //remoteSave
          saveRemoteUserIkoUseCase.call(SaveUserIkoParams(userIko: userIkoToAdd));

          emit(IkoListGetSuccess(userIkoList: userIkoList!));

          return true;
        } else {
          emit(const IKOValueAddedFailure(failureMessage: "Seçtiğiniz saat daha önce eklenmiş olmamalı"));
          getAllUserIko();
          return false;
        }
      }
    } catch (e) {
      print(e.toString());
      emit(const IKOValueAddedFailure(failureMessage: "Eklenirken bir hata oluştu"));
    }

    return true;
  }

  Future<void> deleteSingleUserIko(int userIkoId) async {
    await deleteSingleUserIkoUseCase.call(DeleteUserIkoParams(userIkoId: userIkoId));

    userIkoList!.removeWhere((element) => element.id == userIkoId);
    if (userIkoList!.isNotEmpty) {
      userIkoList!.sort(((a, b) => a.hour!.compareTo(b.hour!)));
    }

    await deleteRemoteUserIkoUseCase.call(DeleteUserIkoParams(userIkoId: userIkoId));

    getAllUserIko();
  }

  Future<void> getAllUserIko() async {
    try {
      userIkoList = await getAllUserIkoListUseCase.call(
        GetAllUserIkoListParams(
          userId: CacheManager.instance.getIntValue(PreferencesKeys.USERID),
        ),
      );

      if (userIkoList!.isNotEmpty) {
        userIkoList!.sort(((a, b) => a.hour!.compareTo(b.hour!)));
        await Future<void>.delayed(const Duration(milliseconds: 50));
        emit(IkoListGetSuccess(userIkoList: userIkoList!));
      } else {
        emit(EmptyIko());
      }
    } catch (e) {}
  }
}
