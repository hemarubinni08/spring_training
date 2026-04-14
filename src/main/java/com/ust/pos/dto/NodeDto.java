package com.ust.pos.dto;


import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class NodeDto extends CommonDto {
    private String path;
    private boolean isSuccess = true;
    private String role;
    private List<String> roles;
}
