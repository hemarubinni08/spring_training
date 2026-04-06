package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;

public interface UserDao {

    boolean register(UserDto userDto);

    boolean existsByEmail(String email);

    boolean registerJdbc(UserDto userDto);
}
