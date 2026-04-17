package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    UserDto register(UserDto userDto);

    UserDto registerJDBC(UserDto userDto);

    List<UserDto> display();

    List<UserDto> displayJDBC();

    UserDto getProfile(String email);

    void deleteProfile(String email);

    UserDto getProfileById(long id);

    UserDto getProfileByIdJDBC(long id);

    UserDto updateprofileJDBC(UserDto userDto);

    UserDto updateprofileJpa(UserDto userDto);

    UserDto getUserByUserEmail(String email);
}
