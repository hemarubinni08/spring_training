package com.ust.pos.service;

import com.ust.pos.dto.UserDto;

public interface UserService {
    UserDto saveData(UserDto userDto);

    boolean saveDataJdbc(UserDto userDto);
}
