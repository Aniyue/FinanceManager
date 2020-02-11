package com.itheima.service;
import com.itheima.po.PageInfo;
import com.itheima.po.Budget;

import java.util.List;

/**
 * 用户Service层接口
 */
public interface BudgetService {

    //分页查询
    public PageInfo<Budget> findPageInfo(Integer bid, String bname,
                                         Integer pageIndex, Integer pageSize);

    public int deleteBudget(Integer bid);   //通过id删除学生信息
    public int addBudget(Budget budget);   //添加学生信息
    public int updateBudget(Budget budget); //修改学生信息
    public Budget findBudgetById(Integer bid);
    public List<Budget> getAll();

}
