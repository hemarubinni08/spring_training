package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

public interface UserDao {
    boolean UpdateByUserName(UserDto userDto);

    boolean registerJdbc(UserDto userDto);

    boolean existsByEmail(String email);

    User existsByEmailJdbc(String userDto);
}
