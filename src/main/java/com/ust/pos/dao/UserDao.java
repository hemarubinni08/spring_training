package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
    void register(UserDto userDto);

    User findByEmail(String email);

    List<User> findAllUsersJdbc();

    void deleteByEmailJdbc(String email);

    User findById(Long id);

    void edit(UserDto userDto);
}