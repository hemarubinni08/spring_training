package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
    boolean createUserJdbc(UserDto userDto);

    User findUserByEmailJdbc(String email);

    List<User> retrieveAllRecords(UserDto userDto);

    void deleteByEmailJdbc(String email);

    User findByIdJdbc(long id);

    Integer updateUserRecord(User user);


}
