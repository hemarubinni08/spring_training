package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

public interface UserService {
    boolean createUser(UserDto userDto);
    boolean createUserJdbc(UserDto userDto);
}
