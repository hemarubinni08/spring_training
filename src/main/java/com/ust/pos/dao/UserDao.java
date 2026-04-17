package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
    boolean saveData(UserDto userDto);

    User findByEmail(String email);

    List<UserDto> fetchUser();

    void deleteByEmail(String email);

    User findByIdJdbc(Long id);
}
