package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.Date;
import java.util.List;

public interface UserService {
    List<UserDto> findAll();

    UserDto getByUsername(String userName);

    UserDto getById();

    void deleteByUsername(String Username);

    UserDto UpdateByUsername(UserDto userDto);
}
