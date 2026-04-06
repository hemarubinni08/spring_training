package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;

public interface UserService {
    boolean createUser(UserDto userDto);

    boolean createUserJdbc(UserDto userDto);

    boolean emailExists(String email);

    boolean emailExistsJdbc(String lowerCase);
}