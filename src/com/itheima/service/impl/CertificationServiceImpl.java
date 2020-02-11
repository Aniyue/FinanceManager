package com.itheima.service.impl;


import com.itheima.dao.CertificationDao;
import com.itheima.po.PageInfo;
import com.itheima.po.Certification;
import com.itheima.service.CertificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户Service接口实现类
 */
@Service("certificationService")
@Transactional
public class CertificationServiceImpl implements CertificationService {
    // 注入certificationDao
    @Autowired
    private CertificationDao certificationDao;


    //分页查询
    @Override
    public PageInfo<Certification> findPageInfo(Integer cid,String cname,
                                                Integer pageIndex, Integer pageSize) {
        PageInfo<Certification> pi = new PageInfo<Certification>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = certificationDao.totalCount(cid,cname);
        if (totalCount>0){
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Certification> certificationList =	certificationDao.getCertificationList(cid,cname,
                    (pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
            pi.setList(certificationList);
        }
        return pi;
    }

    @Override
    public List<Certification> getAll(){
        List<Certification> certificationList = certificationDao.getAll();
        return certificationList;
    }

    //通过id删除凭证信息
    @Override
    public int deleteCertification(Integer cid) {
        return certificationDao.deleteCertification(cid);
    }
    //添加凭证信息
    @Override
    public  int addCertification(Certification certification) {
        return certificationDao.addCertification(certification);
    }
    //修改凭证信息
    @Override
    public int updateCertification(Certification certification) { return certificationDao.updateCertification(certification); }

    @Override
    public Certification findCertificationById (Integer cid){
        Certification c = certificationDao.findCertificationById(cid);
        return  c;
    }


}
