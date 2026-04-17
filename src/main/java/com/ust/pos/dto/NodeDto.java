package com.ust.pos.dto;

import com.ust.pos.model.Common;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class NodeDto extends Common {

    private String path;

    private String role;

    private List<String> roles;
}
