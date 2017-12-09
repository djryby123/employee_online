package employee.controller;

import employee.dao.EmployeeDAO;
import employee.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Qualifier("Employee")
    @Autowired
    public EmployeeDAO dao;

    @RequestMapping("/list")
    public String list(Map<String,Object> map){
        List<Employee> list = dao.list();
        map.put("empList",list);
        return "list";
    }

    @RequestMapping("/add")
    public String add(){
        return "add";
    }

    @RequestMapping("/save")
    public String save(Map<String,Object> map,String id,String name,String age,String job,String salary){
        Employee emp = new Employee();
        setParam(emp,id,name,age,job,salary);
        dao.save(emp);
        List<Employee> list = dao.list();
        map.put("empList",list);
        return "list";
    }

    @RequestMapping("/load")
    public String load(){
        return "modify";
    }

    @RequestMapping("/modify")
    public String modify(Map<String,Object> map,String id,String name,String age,String job,String salary){
        Employee emp = new Employee();
        setParam(emp,id,name,age,job,salary);
        dao.modify(emp);
        List<Employee> list = dao.list();
        map.put("empList",list);
        return "list";
    }

    @RequestMapping("/delete")
    public String delete(Map<String,Object> map,String id){
        dao.delete(id);
        List<Employee> list = dao.list();
        map.put("empList",list);
        return "list";
    }

    public Employee setParam(Employee emp,String id,String name,String age,String job,String salary){
        emp.setId(id);
        emp.setName(name);
        emp.setAge(age);
        emp.setJob(job);
        emp.setSalary(salary);
        return  emp;
    }
}
