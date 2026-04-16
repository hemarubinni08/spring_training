package com.ust.pos;

import com.ust.pos.dto.UserDto;
import com.ust.pos.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class userDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {
    @Autowired
    UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDto userDto = userService.findDetails(username);
        if (userDto == null) {
            throw new UsernameNotFoundException("User not found" + username);
        }
        return org.springframework.security.core.userdetails.User
                .withUsername(userDto.getUserName())
                .password(userDto.getPassword())
                .build();
    }
}