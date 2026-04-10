package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {

    UserDto createUser(UserDto user);

    boolean emailExists(String email);

    boolean emailExistsJdbc(String email);

    void createUserJdbc(UserDto userDto);

    List<UserDto> getUsers();

    List<UserDto> getUsersJpa();

    UserDto getUserByEmail(String email);

    UserDto getUserByEmailJdbc(String email);

    void deleteUserByEmail(String email);

    void deleteUserByEmailJpa(String email);

    UserDto getUserById(Long id);

    UserDto getUserByIdJdbc(Long id);

    UserDto updateUser(UserDto userDto);

    boolean updateUserJdbc(UserDto user);

    boolean updateUserJpa(UserDto user);


}