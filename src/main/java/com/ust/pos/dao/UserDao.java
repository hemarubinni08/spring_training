package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

public interface UserDao {
    void update(UserDto userDto);

    User findByEmail(String email);
}