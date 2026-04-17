package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;

import java.util.List;

public interface UserService {
    UserDto findByUserName(String username);

    UserDto findByIdJpa(long id);

    UserDto findById(long id);

    UserDto saveData(UserDto userDto);

    UserDto registerJdbc(UserDto userDto);

    List<UserDto> findAllUser();

    List<UserDto> findAllUsersJpa();

    UserDto findByEmail(String email);

    UserDto findByEmailJpa(String email);

    void deleteUser(String email);

    UserDto UpdateData(UserDto userDto);

    UserDto UpdateUserJpa(UserDto userDto);

    UserDto getUserbyUserName(String username);
}
