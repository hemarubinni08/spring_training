package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

public interface UserDao {
    Boolean save(UserDto userDto);

    User findByEmail(String email);
}
