package employee.dao;

import employee.entity.Employee;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("Employee")
public interface EmployeeDAO {

    void save(Employee emp);

    void delete(String id);

    List<Employee> list();

    void modify(Employee emp);
}
