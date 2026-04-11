package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    void register(UserDto userDto);

    boolean registerJdbc(UserDto userDto);

    List<UserDto> getAllUsers();

    List<UserDto> getAllUsersJdbc();

    UserDto getUserByEmail(String email);

    UserDto getUserByEmailJdbc(String email);

    void deleteByEmail(String email);

    boolean deleteUserByEmailJdbc(String email);

    UserDto getUserById(long id);

    UserDto getUserByIdJdbc(long id);

    void deleteById(Long id);

    UserDto update(UserDto userDto);

    UserDto findById(Long id);

    boolean existsByEmail(String email);
}
