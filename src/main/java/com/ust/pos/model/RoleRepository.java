
package com.ust.pos.model;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role, Long> {

    boolean existsByNameAndIdNot(String name, long id);

    Optional<Role> findByName(String name);
}
