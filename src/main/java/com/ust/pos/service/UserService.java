package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {

    boolean updateUserDetailsById(UserDto userDto);

    boolean existsByEmail(String email);

    boolean createUserJdbc(UserDto userDto);

    List<UserDto> retrieveAllRecords(UserDto userDto);

    List<UserDto> retrieveAllRecordsDto();

    UserDto getUserByEmailId(String email);

    UserDto getUsersByEmailIdPath(String email);

    UserDto getUsersByEmailIdJdbc(String email);

    void deleteUsersByEmailId(String email);

    void deleteUsersByEmailIdJdbc(String email);

    UserDto findById(long id);

    UserDto getUsersByIdJdbc(long id);

    UserDto updateUserRecord(UserDto userDto);

    UserDto updateUserRecordJdbc(UserDto userDto);

    boolean checkLoginDetails(UserDto userDto);

    UserDto findByUsername(String userName);
}
