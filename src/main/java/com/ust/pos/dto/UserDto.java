package com.ust.pos.dto;

import com.ust.pos.model.Common;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Getter
@Setter
public class UserDto extends Common {

    private String email;

    private String phoneNo;

    private String userName;

    private String password;

    private int age;

    private String message;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dateOfBirth;

    private String role;

    private List<String> roles;

}
