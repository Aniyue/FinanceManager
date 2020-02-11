package com.itheima.dao;

import com.itheima.po.Salary;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 薪资DAO层接口
 */
public interface SalaryDao {
    /**
     * 进行分页查询
     */

    //获取总条数
    public Integer totalCount(@Param("sid") Integer sid, @Param("sname") String sname);
    //获取用户列表
    public List<Salary> getSalaryList(@Param("sid") Integer sid, @Param("sname") String sname, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    public int deleteSalary(Integer sid);   //删除薪资信息
    public int addSalary(Salary salary);   //添加薪资信息
    public int updateSalary(Salary salary); //修改薪资信息
    public Salary findSalaryById(Integer sid);
    public List<Salary> getAll();
}
