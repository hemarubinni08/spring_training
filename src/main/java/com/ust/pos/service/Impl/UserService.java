package com.ust.pos.service.Impl;

import com.ust.pos.dto.UserDto;


public interface UserService {

    UserDto createUser(UserDto userDto);
    UserDto createUserJdbc(UserDto userDto);

}