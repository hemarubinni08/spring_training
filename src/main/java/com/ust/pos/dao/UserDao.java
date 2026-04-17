package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {

    void saveAUser(UserDto userdto);

    User findByEmail(String email);

    List<User> findAllUsers();

    boolean existsByEmail(String email);

    boolean deleteByEmail(String email);

    User findById(Long id);

    int updateUser(UserDto userDto);


}
