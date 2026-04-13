package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
    boolean registerjdbc(UserDto userDto);

    User findByEmail(String email);

    List<User> printAllUsersJdbc();

    void deleteByEmailJdbc(String email);

    User findById(Long id);

    boolean updateUserJdbc(UserDto userDto);

}
