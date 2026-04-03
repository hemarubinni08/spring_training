package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    List<UserDto> getAllUsers();
    UserDto getById(Long id);
    void deleteUserById(Long id);
    UserDto updateUser(UserDto userDto);
}
