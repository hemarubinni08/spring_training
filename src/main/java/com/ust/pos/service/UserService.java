package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserService {
    boolean register(UserDto userDto);

    boolean saveDataJdbc(UserDto userDto);
}