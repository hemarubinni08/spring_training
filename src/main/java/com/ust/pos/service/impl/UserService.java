package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

    boolean registration(UserDto userDto);

    boolean createUser(UserDto userDto);

    boolean createUserJdbc(UserDto userDto);


}

