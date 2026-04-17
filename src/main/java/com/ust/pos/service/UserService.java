package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    boolean UpdateByUserName(UserDto userDto);

    boolean registerJdbc(UserDto userDto);

    boolean existsByEmail(String email);

    boolean createUserJdbc(UserDto userDto);

    List<UserDto> getAllUsers();

    List<UserDto> getAllUsersJpa();

    UserDto findUserRecord(String email);

    UserDto findUserRecordJdbc(String email);

    UserDto findByEmail(String email);

    UserDto deleteByEmailService(String email);

    boolean deleteByEmailServiceJdbc(String email);

    UserDto getByIdService(Long id);

    UserDto getByIdServiceJdbc(long id);

    UserDto updateByIdService(UserDto userDto);

    UserDto updateUserJdbc(UserDto userDto);

    UserDto getUserByUserName(String userName);

    UserDto findByEmailJdbc(String email);
}