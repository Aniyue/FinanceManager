package com.itheima.controller;


import com.itheima.po.PageInfo;
import com.itheima.po.Salary;
import com.itheima.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户控制器类
 */
@Controller
public class SalaryController {
    // 依赖注入
    @Autowired
    private SalaryService salaryService;

    /**
     * 分页查询
     * pageIndex 当前页码
     * pageSize  显示条数
     */
    @RequestMapping(value = "/findSalary")
    public String findSalary(Integer sid,String sname,
                             Integer pageIndex, Integer pageSize, Model model) {

        PageInfo<Salary> pi = salaryService.findPageInfo(sid,sname,pageIndex,pageSize);
        model.addAttribute("pi",pi);
        model.addAttribute("sname",sname);
        return "salary_list";
    }

    /**
     * 导出Excel
     */
    @RequestMapping(value = "/exportsalarylist", method = RequestMethod.POST)
    @ResponseBody
    public List<Salary> exportSalary(){
        List<Salary> salaryList = salaryService.getAll();
        return salaryList;
    }

    /**
     * 删除薪资信息
     */
    @RequestMapping( "/deleteSalary")
    @ResponseBody
    public String deleteSalary(Integer sid) {
        int s = salaryService.deleteSalary(sid);
        return "salary_list";
    }

    /**
     * 添加薪资信息
     */

    @RequestMapping(value = "/addSalary" ,method = RequestMethod.POST)
    @ResponseBody
    public String addSalary(@RequestBody Salary salary) {
        int s = salaryService.addSalary(salary);
        return "salary_list";
    }

    /**
     * 修改薪资信息
     */
    @RequestMapping(value = "/updateSalary" ,method = RequestMethod.POST )
    public String updateSalary( Salary salary) {
        int s = salaryService.updateSalary(salary);
        return "redirect:/findSalary";
    }

    //用id查询
    @RequestMapping( "/findSalaryById")
    public String findSalaryById(Integer sid, HttpSession session) {

        Salary s= salaryService.findSalaryById(sid);
        session.setAttribute("s",s);
        return "salary_edit";
    }
}
