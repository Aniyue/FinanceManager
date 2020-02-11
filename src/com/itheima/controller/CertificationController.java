package com.itheima.controller;


import com.itheima.po.PageInfo;
import com.itheima.po.Certification;
import com.itheima.service.CertificationService;
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
public class CertificationController {
    // 依赖注入
    @Autowired
    private CertificationService certificationService;

    /**
     * 分页查询
     * pageIndex 当前页码
     * pageSize  显示条数
     */
    @RequestMapping(value = "/findCertification")
    public String findCertification(Integer cid,String cname,
                                    Integer pageIndex, Integer pageSize, Model model) {

        PageInfo<Certification> pi = certificationService.findPageInfo(cid,cname,pageIndex,pageSize);
        model.addAttribute("pi",pi);
        model.addAttribute("cname",cname);
        return "certification_list";
    }

    /**
     * 导出Excel
     */
    @RequestMapping(value = "/exportcertificationlist", method = RequestMethod.POST)
    @ResponseBody
    public List<Certification> exportCertification(){
        List<Certification> certificationList = certificationService.getAll();
        return certificationList;
    }

    /**
     * 删除凭证信息
     */
    @RequestMapping( "/deleteCertification")
    @ResponseBody
    public String deleteCertification(Integer cid) {
        int c = certificationService.deleteCertification(cid);
        return "certification_list";
    }

    /**
     * 添加凭证信息
     */

    @RequestMapping(value = "/addCertification" ,method = RequestMethod.POST)
    @ResponseBody
    public String addCertification(@RequestBody Certification certification) {
        int c = certificationService.addCertification(certification);
        return "certification_list";
    }

    /**
     * 修改学生信息
     */
    @RequestMapping(value = "/updateCertification" ,method = RequestMethod.POST )
    public String updateCertification( Certification certification) {
        int c = certificationService.updateCertification(certification);
        return "redirect:/findCertification";
    }

    //用id查询
    @RequestMapping( "/findCertificationById")
    public String findCertificationById(Integer cid, HttpSession session) {

        Certification c= certificationService.findCertificationById(cid);
        session.setAttribute("c",c);
        return "certification_edit";
    }
}
