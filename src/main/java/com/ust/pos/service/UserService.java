package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

public interface UserService {
    UserDto update(UserDto userDto);

    UserDto updateJDBC(UserDto userDto);
}
