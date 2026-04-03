
package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface UserService {

    UserDto findById(Long id);
    UserDto findByUserName(String userName);
    List<UserDto> findAllUsers();
    UserDto update(UserDto userDto);
    void deleteById(Long id);
    boolean register(UserDto userDto);
    boolean existsByEmail(String email);

}

