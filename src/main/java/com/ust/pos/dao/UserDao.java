package com.ust.pos.dao;

import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;

import java.util.List;

public interface UserDao {
    List<User> findAll();
    User findById(Long id);
    void deleteById(Long id);
    User updateById(UserDto userDto);
    User createUser(UserDto userDto);
    List<User> verifyUserAge();
    User findByEmailManually(String email);
    List<User> findByPhoneNumber(String phoneNumber);
    void createUserJdbc(UserDto userDto);
    User findByEmail(String email);
}
