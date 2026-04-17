package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {

    boolean UpdateByUserName(UserDto userDto);

    boolean registerJdbc(UserDto userDto);

    boolean existsByEmail(String email);

    User existsByEmailJdbc(String userDto);

    List<User> userRecJdbc();

    boolean deleteByEmailJdbc(String email);

    User findByEmail(String email);

    User findByIdJdbc(long id);

    boolean updateByIdd(UserDto userDto);
}