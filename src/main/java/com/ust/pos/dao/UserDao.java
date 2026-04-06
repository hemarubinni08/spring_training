package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;

public interface UserDao {

    boolean existsByEmail(String email);

    boolean createUser(UserDto userDto);

    boolean createUserJdbc(UserDto userDto);
}
