package com.ust.pos.service;

import com.ust.pos.dto.UserDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {

    boolean saveAUSer(UserDto userDto);

    UserDto findByEmail(String email);

    UserDto findByEmailUsingJpa(String email);

    boolean existsByEmail(String email);

    UserDto findByUserNameService(String userName);

    boolean existsByUserName(String userName);

    boolean saveAUserJdbc(UserDto userDto);

    boolean existsByEmailJdbc(String email);

    List<UserDto> fetchAllUsersList();

    List<UserDto> fetchAllUsersListUsingJpa();

    UserDto deleteByEmailService(String email);

    boolean deleteByEmailServiceJdbc(String email);

    UserDto findByIdService(Long id);

    UserDto findByIdServiceUsingJdbc(Long id);

    UserDto updateUsingJpaService(UserDto userDto);

    int updateUsingJpaServiceUsingJdbc(UserDto userDto);


}
