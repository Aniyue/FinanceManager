package com.itheima.dao;

import com.itheima.po.Budget;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 管理员DAO层接口
 */
public interface BudgetDao {
    /**
     * 进行分页查询
     */

    //获取总条数
    public Integer totalCount(@Param("bid") Integer bid, @Param("bname") String bname);
    //获取用户列表
    public List<Budget> getBudgetList(@Param("bid") Integer bid, @Param("bname") String bname, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    public int deleteBudget(Integer bid);   //删除预算信息
    public int addBudget(Budget budget);   //添加预算信息
    public int updateBudget(Budget budget); //修改预算信息
    public Budget findBudgetById(Integer bid);
    public List<Budget> getAll();
}
