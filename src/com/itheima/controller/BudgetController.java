package com.itheima.controller;


import com.itheima.po.PageInfo;
import com.itheima.po.Budget;
import com.itheima.service.BudgetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * 用户控制器类
 */
@Controller
public class BudgetController {
    // 依赖注入
    @Autowired
    private BudgetService budgetService;

    /**
     * 分页查询
     * pageIndex 当前页码
     * pageSize  显示条数
     */
    @RequestMapping(value = "/findBudget")
    public String findBudget(Integer bid, String bname,
                             Integer pageIndex, Integer pageSize, Model model) {

        PageInfo<Budget> pi = budgetService.findPageInfo(bid, bname, pageIndex, pageSize);
        model.addAttribute("pi", pi);
        model.addAttribute("bname", bname);
        return "budget_list";
    }

    /**
     * 导出Excel
     */
    @RequestMapping(value = "/exportbudgetlist", method = RequestMethod.POST)
    @ResponseBody
    public List<Budget> exportBudget() {
        List<Budget> budgetList = budgetService.getAll();
        return budgetList;
    }

    /**
     * 删除预算信息
     */
    @RequestMapping("/deleteBudget")
    @ResponseBody
    public String deleteBudget(Integer bid) {
        int b = budgetService.deleteBudget(bid);
        return "budget_list";
    }

    /**
     * 添加预算信息
     */

    @RequestMapping(value = "/addBudget", method = RequestMethod.POST)
    @ResponseBody
    public String addBudget(@RequestBody Budget budget) {
        int b = budgetService.addBudget(budget);
        return "budget_list";
    }

    /**
     * 修改预算信息
     */
    @RequestMapping(value = "/updateBudget", method = RequestMethod.POST)
    public String updateBudget(Budget budget) {
        int b = budgetService.updateBudget(budget);
        return "redirect:/findBudget";
    }

    //用id查询
    @RequestMapping("/findBudgetById")
    public String findBudgetById(Integer bid, HttpSession session) {

        Budget b = budgetService.findBudgetById(bid);
        session.setAttribute("b", b);
        return "budget_edit";
    }

@ResponseBody
@RequestMapping("/upload/add")
public Map<String,Object> addlunbo(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
    Assert.notNull(file, "上传文件不能为空");
    String filepath = request.getServletContext().getRealPath("/upload");
    String filename = System.currentTimeMillis()+file.getOriginalFilename();
    //确保路径存在
    File file2 = new File(filepath);
    if (!file2.exists()) {
        file2.mkdirs();
    }
    String savepath = filepath+"\\"+filename;
    System.out.println("文件保存路径:"+savepath);
    Map map = new HashMap<String,Object>();
    try {
        //保存文件到服务器
        file.transferTo(new File(savepath));
        //保存到数据库

        //返回json
        map.put("msg","ok");
        map.put("code",200);
            /*加不加这个都行
            map.put("data",new HashMap<String,Object>(){
                {
                    put("src",savepath);
                }
            });*/

    } catch (Exception e) {
        map.put("msg","error");
        map.put("code",0);
        e.printStackTrace();
    }

    return map;
}


}

