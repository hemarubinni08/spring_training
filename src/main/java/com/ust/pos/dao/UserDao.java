package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {

    boolean createUser(UserDto userDto);

    User findByEmail(String email);

    User findById(long id);

    List<User> listOfUsers();

    boolean updateUser(UserDto userDto);

    void deleteByEmail(String email);

}
