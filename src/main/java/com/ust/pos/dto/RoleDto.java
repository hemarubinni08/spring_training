package com.ust.pos.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

@Getter
@Setter

public class RoleDto extends CommonDto{
    private boolean isSuccess = true;
}
