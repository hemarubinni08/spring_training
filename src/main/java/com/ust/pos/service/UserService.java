package com.ust.pos.service;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserService{
    UserDto findById(long id);
    List<UserDto> findAll();
    UserDto getbyuserName(String userName);
    void deleteById(long id);
    UserDto update(UserDto userDto);
    UserDto save(UserDto userDto);
}
