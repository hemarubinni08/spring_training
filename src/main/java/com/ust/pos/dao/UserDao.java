package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
        List<User> findAll();

        User findById(Long id);

        User findByUserName(String username);

        User update(Long id, UserDto userDto);

        void deleteById(Long id);

        boolean registerjdbc(UserDto userDto);

}
