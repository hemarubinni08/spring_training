package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    boolean save(UserDto userDto);

    User findByEmail(String email);
}