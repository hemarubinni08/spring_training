package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
    boolean saveUser(UserDto userDto);

    User findByEmail(String email);

    List<UserDto> getAllUserJdbc();

    boolean deleteByEmailJdbc(String email);

    UserDto getUserByIdJdbc(Long id);
}