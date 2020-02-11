package com.itheima.service.impl;


import com.itheima.dao.BudgetDao;
import com.itheima.po.PageInfo;
import com.itheima.po.Budget;
import com.itheima.service.BudgetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户Service接口实现类
 */
@Service("budgetService")
@Transactional
public class BudgetServiceImpl implements BudgetService {
    // 注入budgetDao
    @Autowired
    private BudgetDao budgetDao;


    //分页查询
    @Override
    public PageInfo<Budget> findPageInfo(Integer bid,String bname,
                                         Integer pageIndex, Integer pageSize) {
        PageInfo<Budget> pi = new PageInfo<Budget>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = budgetDao.totalCount(bid,bname);
        if (totalCount>0){
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Budget> budgetList =	budgetDao.getBudgetList(bid,bname,
                    (pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
            pi.setList(budgetList);
        }
        return pi;
    }

    @Override
    public List<Budget> getAll(){
        List<Budget> budgetList = budgetDao.getAll();
        return budgetList;
    }

    //通过id删除预算信息
    @Override
    public int deleteBudget(Integer bid) {
        return budgetDao.deleteBudget(bid);
    }
    //添加预算信息
    @Override
    public  int addBudget(Budget budget) {
        return budgetDao.addBudget(budget);
    }
    //修改预算信息
    @Override
    public int updateBudget(Budget budget) { return budgetDao.updateBudget(budget); }

    @Override
    public Budget findBudgetById (Integer bid){
        Budget b = budgetDao.findBudgetById(bid);
        return  b;
    }


}
