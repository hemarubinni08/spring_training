package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;

public interface UserDao {

    boolean saveAUser(UserDto userdto);
    boolean existsByEmail(String email);

}
