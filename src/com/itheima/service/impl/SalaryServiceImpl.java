package com.itheima.service.impl;


import com.itheima.dao.SalaryDao;
import com.itheima.po.PageInfo;
import com.itheima.po.Salary;
import com.itheima.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户Service接口实现类
 */
@Service("salaryService")
@Transactional
public class SalaryServiceImpl implements SalaryService {
    // 注入salaryDao
    @Autowired
    private SalaryDao salaryDao;


    //分页查询
    @Override
    public PageInfo<Salary> findPageInfo(Integer sid,String sname,
                                         Integer pageIndex, Integer pageSize) {
        PageInfo<Salary> pi = new PageInfo<Salary>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = salaryDao.totalCount(sid,sname);
        if (totalCount>0){
            pi.setTotalCount(totalCount);
            //每一页显示薪资信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Salary> salaryList =	salaryDao.getSalaryList(sid,sname,
                    (pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
            pi.setList(salaryList);
        }
        return pi;
    }

    @Override
    public List<Salary> getAll(){
        List<Salary> salaryList = salaryDao.getAll();
        return salaryList;
    }

    //通过id删除薪资信息
    @Override
    public int deleteSalary(Integer sid) {
        return salaryDao.deleteSalary(sid);
    }
    //添加薪资信息
    @Override
    public  int addSalary(Salary salary) {
        return salaryDao.addSalary(salary);
    }
    //修改薪资信息
    @Override
    public int updateSalary(Salary salary) { return salaryDao.updateSalary(salary); }

    @Override
    public Salary findSalaryById (Integer sid){
        Salary s = salaryDao.findSalaryById(sid);
        return  s;
    }


}
