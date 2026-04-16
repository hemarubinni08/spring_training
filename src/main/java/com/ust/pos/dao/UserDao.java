package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
    boolean createUserJdbc(UserDto userDto);

    User findByEmail(String email);

    User findById(long id);

    List<User> findAll();

    void deleteByEmail(String email);

    void updateById(UserDto userDto);
}
