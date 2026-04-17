package com.ust.pos.service.impl;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.UserServiceRitu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class PosUserDetailsService implements UserDetailsService {
    @Autowired
    private UserServiceRitu userService;
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        UserDto userDto=userService.getUserByEmail(email);
        if(userDto==null){
            throw new UsernameNotFoundException("User not found:" + email);
        }
        return org.springframework.security.core.userdetails.User
                .withUsername(userDto.getEmail())
                .password(userDto.getPassword())
                .build();
    }
}
