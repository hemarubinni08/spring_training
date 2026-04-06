package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

public interface UserDao {
    boolean save(UserDto userDto);
    User fundByEmail(String email);
}

