package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {

    boolean register(UserDto userDto);

    boolean saveDataJdbc(UserDto userDto);

    List<UserDto> printAllUsers();

    List<UserDto> printAllUsersJdbc();

    UserDto getProfile(String email);

    UserDto getProfileJdbc(String email);

    void deleteByEmail(String email);

    void deleteByEmailJdbc(String email);

    UserDto findById(Long id);

    UserDto findByIdJdbc(Long id);

    UserDto getByUsername(String username);

    boolean updateUser(UserDto userDto);

    boolean updateUserJdbc(UserDto userDto);

}