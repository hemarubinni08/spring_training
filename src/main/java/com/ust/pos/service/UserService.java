package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    UserDto saveData(UserDto userDto);

    boolean saveDataJdbc(UserDto userDto);

    List<UserDto> getAllUsers();

    List<UserDto> getAllUsersJdbc();

    UserDto findByEmailJpa(String email);

    UserDto findByEmail(String email);

    void deleteByEmail(String email);

    void deleteByEmailJdbc(String email);

    UserDto findById(Long id);

    UserDto findByIdJdbc(Long id);

    UserDto updateDataJpa(UserDto userDto);

    int updateDataJdbc(UserDto userDto);

}
