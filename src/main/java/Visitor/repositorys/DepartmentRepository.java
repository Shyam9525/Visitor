package Visitor.repositorys;

import org.springframework.data.repository.CrudRepository;

import Visitor.models.Department;

public interface DepartmentRepository extends CrudRepository<Department,Integer>{

}
