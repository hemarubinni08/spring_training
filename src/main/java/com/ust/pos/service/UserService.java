package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserService {
    UserDto findByUserName(String username);

    UserDto findById(Long id);

    UserDto saveData(UserDto userDto);

    UserDto registerJdbc(UserDto userDto);
}
