package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;

public interface UserService {

    boolean register(UserDto userDto);

    boolean registerJdbc(UserDto userDto);

    boolean existsByEmail(String email);
}