package com.ust.pos.service.Impl;

import com.ust.pos.dto.UserDto;

import java.util.List;


public interface UserService {

    UserDto createUser(UserDto userDto);

    UserDto createUserJdbc(UserDto userDto);

    List<UserDto> findAllUsers();

    List<UserDto> findAllUsersJdbc();

    UserDto findByEmail(String email);

    UserDto findByEmailJdbc(String email);

    void deleteByEmailJpa(Long id);

    UserDto findById(Long id);

    UserDto editUserProfile(UserDto userDto);

}