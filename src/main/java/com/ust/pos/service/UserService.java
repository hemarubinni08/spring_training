package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

public interface UserService {
    String update(UserDto userDto);

    String registerUsingJdbc(UserDto userDto);
}