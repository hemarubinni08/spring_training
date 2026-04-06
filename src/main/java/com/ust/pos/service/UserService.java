package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import org.springframework.stereotype.Repository;

@Repository
public interface UserService {
    UserDto registerUser(UserDto userDto);

    UserDto registerUserJdbc(UserDto userDto);
}