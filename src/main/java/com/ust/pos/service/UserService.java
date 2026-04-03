package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {

    UserDto createUser(UserDto user);

    UserDto getUserById(Long id);

    List<UserDto> getAllUsers();

    UserDto updateUser(Long id, UserDto user);

    void deleteUser(Long id);

    UserDto register(UserDto userDto);

    boolean emailExists(String email);
}
