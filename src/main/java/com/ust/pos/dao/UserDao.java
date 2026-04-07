package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

public interface UserDao {
    void register(UserDto userDto);

    void registerJdbc(UserDto userDto);

    User findByEmail(String email);

}
