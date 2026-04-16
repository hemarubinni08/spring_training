package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.UserServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service

public class PosUserDetailsService implements UserDetailsService {

    @Autowired
    private UserServiceInterface userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        UserDto userDto = userService.getUserProfileByEmail(username);

        if(userDto == null) {
            throw new UsernameNotFoundException("User not found: " + username);
        }

        return org.springframework.security.core.userdetails.User
                .withUsername(userDto.getUserName())
                .password(userDto.getPassword())
                .build();

    }
}
