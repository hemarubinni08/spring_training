package com.ust.pos.dao;

import com.ust.pos.model.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository

public interface RoleDao {
    List<Role> findAllRolesJdbc();

    boolean saveRoleJdbc(Role role);

    boolean existsByName(String name);

    void deleteById(Long id);

    boolean updateRoleJdbc(Role role);

    Role getById(Long id);
}