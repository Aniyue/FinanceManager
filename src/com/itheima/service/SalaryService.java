package com.itheima.service;
import com.itheima.po.PageInfo;
import com.itheima.po.Salary;

import java.util.List;

/**
 * 用户Service层接口
 */
public interface SalaryService {

    //分页查询
    public PageInfo<Salary> findPageInfo(Integer sid, String sname,
                                         Integer pageIndex, Integer pageSize);

    public int deleteSalary(Integer sid);   //通过id删除薪资信息
    public int addSalary(Salary salary);   //添加薪资信息
    public int updateSalary(Salary salary); //修改薪资信息
    public Salary findSalaryById(Integer sid);
    public List<Salary> getAll();

}
