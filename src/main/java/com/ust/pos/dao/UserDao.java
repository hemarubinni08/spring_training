package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

public interface UserDao {
    User findByEmailCustom(String email);

    boolean update(UserDto userDto);

}