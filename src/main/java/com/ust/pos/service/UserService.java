package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserService {
    void register(UserDto userDto);

    boolean registerJdbc(UserDto userDto);

}
