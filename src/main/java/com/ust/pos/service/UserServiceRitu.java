package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserServiceRitu {
    UserDto register(UserDto userDto);

    UserDto registerJdbc(UserDto userDto);
    UserDto updateJdbc(UserDto userDto);
    UserDto updateJpa(UserDto userDto);
    List<UserDto> fetchAllUsers();

    List<UserDto> fetchAllUsersJdbc();

    UserDto getUserByEmail(String email);

    UserDto getUserByIdJdbc(Long id);

    UserDto getUserByIdJpa(Long id);

    void deleteByEmailJpa(String email);

    void deleteByEmailJdbc(String email);
}
