package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;

public interface UserDao {

    boolean createUser(UserDto userDto);

    boolean emailExists(String email);
}