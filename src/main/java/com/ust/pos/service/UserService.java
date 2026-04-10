package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserService {
    UserDto update(UserDto userDto);

    UserDto updateJDBC(UserDto userDto);

    List<UserDto> display();

    List<UserDto> displayJDBC();

    UserDto getProfile(String email);

    void deleteProfile(String email);

    UserDto getProfileById(long id);

    UserDto getProfileByIdJDBC(long id);

    UserDto updateprofileJDBC(UserDto userDto);

    UserDto updateprofileJpa(UserDto userDto);
}
