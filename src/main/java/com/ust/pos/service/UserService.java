package com.ust.pos.service;
import com.ust.pos.dto.UserDto;
import org.springframework.stereotype.Repository;

@Repository
public interface UserService{

    UserDto save(UserDto userDto);
    boolean createUserJdbc(UserDto userDto);
}
