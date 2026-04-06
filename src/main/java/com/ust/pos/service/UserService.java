package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

public interface UserService {
    UserDto saveUser(UserDto userDto);

    boolean saveUserJdbc(UserDto userDto);

}