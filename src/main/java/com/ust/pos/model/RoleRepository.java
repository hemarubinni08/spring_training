package com.ust.pos.model;


import com.ust.pos.dto.RoleDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<Role , Long> {
    Role findByName(String roleDto);
}
