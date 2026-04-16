package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    UserDto createUserJpa(UserDto userDto);

    UserDto createUserJdbc(UserDto userDto);

    List<UserDto> listOfUsersJpa();

    List<UserDto> listOfUsersJdbc();

    UserDto findByEmailJpa(String email);

    UserDto findByEmailJdbc(String email);

    UserDto findByIdJpa(Long id);

    UserDto findByIdJdbc(Long id);

    UserDto updateUserJpa(UserDto userDto);

    UserDto updateUserJdbc(UserDto userDto);

    void deleteByEmailJpa(String email);

    void deleteByEmailJdbc(String email);



}
