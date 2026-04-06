package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

public interface UserDao {
    boolean createUserJdbc(UserDto userDto);

    User findUserByEmailJdbc(String email);
}
