package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

public interface UserService {
    UserDto updateUniqueUser(UserDto userDto);

    boolean createUserUsingDao(UserDto userDto);
}
