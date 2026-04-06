package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

public interface UserService {

    UserDto register(UserDto userDto);

    void registerUsingJdbc(UserDto userDto);
}

