package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import org.springframework.stereotype.Service;

@Service
public interface UserService {

    boolean saveAUSer(UserDto userDto);

    boolean existsByEmail(String email);

    boolean existsByUserName(String userName);

    boolean saveAUserJdbc(UserDto userDto);

    boolean existsByEmailJdbc(String email);

}
