package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

public interface UserServiceInterface {

    String update(UserDto userDto);

    String createUserJdbc(UserDto userDto);
}