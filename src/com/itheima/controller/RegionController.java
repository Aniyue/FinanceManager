package com.itheima.controller;


import com.itheima.po.PageInfo;
import com.itheima.po.Region;
import com.itheima.service.RegionService;
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
public class RegionController {
    // 依赖注入
    @Autowired
    private RegionService regionService;

    /**
     * 分页查询
     * pageIndex 当前页码
     * pageSize  显示条数
     */
    @RequestMapping(value = "/findRegion")
    public String findRegion(Integer r_regionkey,String r_name,
                             Integer pageIndex, Integer pageSize, Model model) {

        PageInfo<Region> pi = regionService.findPageInfo(r_regionkey,r_name,pageIndex,pageSize);
        model.addAttribute("pi",pi);
        model.addAttribute("r_name",r_name);
        return "region_list";
    }

    /**
     * 导出Excel
     */
    @RequestMapping(value = "/exportregionlist", method = RequestMethod.POST)
    @ResponseBody
    public List<Region> exportRegion(){
        List<Region> regionList = regionService.getAll();
        return regionList;
    }

    /**
     * 删除学生信息
     */
    @RequestMapping( "/deleteRegion")
    @ResponseBody
    public String deleteRegion(Integer r_regionkey) {
        int r = regionService.deleteRegion(r_regionkey);
        return "region_list";
    }

    /**
     * 添加学生信息
     */

    @RequestMapping(value = "/addRegion" ,method = RequestMethod.POST)
    @ResponseBody
    public String addRegion(@RequestBody Region region) {
        int r = regionService.addRegion(region);
        return "region_list";
    }

    /**
     * 修改学生信息
     */
    @RequestMapping(value = "/updateRegion" ,method = RequestMethod.POST )
    public String updateRegion( Region region) {
        int r = regionService.updateRegion(region);
        return "redirect:/findRegion";
    }

    //用id查询
    @RequestMapping( "/findRegionById")
    public String findRegionById(Integer r_regionkey, HttpSession session) {

        Region r= regionService.findRegionById(r_regionkey);
        session.setAttribute("r",r);
        return "region_edit";
    }
}
