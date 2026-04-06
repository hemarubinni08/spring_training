package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
    User findByEmailCustom(String email);

    User findByUserName(String userName);

    List<User> findAllUsers();

    void deleteById(Long id);

    boolean update(UserDto userDto);

    boolean login(String email, String password);
}