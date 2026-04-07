package com.ust.pos.service;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserService{

    UserDto save(UserDto userDto);
    boolean createUserJdbc(UserDto userDto);
    List<UserDto> getData();
    List<UserDto> getDataJdbc();
    UserDto getUserDetailsJdbc(String email);
    UserDto getUserDetails(String email);
    void deleteUser(String email);
    void deleteUserJdbc(String email);
}
