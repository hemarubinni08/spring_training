package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

public interface UserService {

    Boolean save(UserDto userDto);

    Boolean createUserJdbc(UserDto userDto);
}

