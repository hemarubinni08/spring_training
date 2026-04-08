package com.ust.pos.service;
import com.ust.pos.dto.UserDto;
import com.ust.pos.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserService{

    UserDto createUser(UserDto userDto);
    boolean createUserJdbc(UserDto userDto);
    List<UserDto> getData();
    List<UserDto> getDataJdbc();
    UserDto getUserDetailsJdbc(String email);
    UserDto getUserDetails(String email);
    void deleteUser(String email);
    void deleteUserJdbc(String email);
    UserDto getUserDetailsById(Long id);
    UserDto getUserDetailsByIdJdbc(Long id);
    UserDto updaterUserJdbc(UserDto userDto);
    UserDto updateUserJpa(UserDto userDto);
}
