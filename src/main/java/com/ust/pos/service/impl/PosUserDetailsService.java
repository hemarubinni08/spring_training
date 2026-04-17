package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class PosUserDetailsService implements UserDetailsService {
    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        UserDto userDto = userService.getUserByUserName(userName);
        if (userDto==null){
            throw new UsernameNotFoundException("User not found: "+ userName);
        }
        return org.springframework.security.core.userdetails.User
                .withUsername(userDto.getUserName())
                .password(userDto.getPassword())
                .build();
    }
}