package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

public interface UserService {

    Boolean register(UserDto userDto);

    boolean createUserJdbc(UserDto userDto);
}
