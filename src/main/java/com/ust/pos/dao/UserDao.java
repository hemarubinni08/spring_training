package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

public interface UserDao {
    boolean register(UserDto userDto);

    User findByEmail(String email);
}
