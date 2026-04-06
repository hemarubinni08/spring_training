package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

public interface UserService {
    boolean register(UserDto userDto);

    boolean registerJdbc(UserDto userDto);
}