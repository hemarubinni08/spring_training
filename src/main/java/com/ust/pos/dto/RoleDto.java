package com.ust.pos.dto;

import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Table
@Getter
@Setter
public class RoleDto {
    private long id;
    private String name;
}
