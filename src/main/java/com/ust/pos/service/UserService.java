package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    String register(UserDto userDto);

    String registerUsingJdbc(UserDto userDto);

    List<UserDto> getAllUsers();

    List<UserDto> getUsersJdbc();

    UserDto findDetails(String email);

    UserDto findDetailsJdbc(String email);

    void deleteDetails(String email);

    void deleteDetailsJdbc(String email);

    UserDto updateValueJdbc(UserDto userDto);

    UserDto updateValue(UserDto userDto);
}