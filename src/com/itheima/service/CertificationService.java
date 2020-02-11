package com.itheima.service;
import com.itheima.po.PageInfo;
import com.itheima.po.Certification;

import java.util.List;

/**
 * 用户Service层接口
 */
public interface CertificationService {

    //分页查询
    public PageInfo<Certification> findPageInfo(Integer cid, String cname,
                                                Integer pageIndex, Integer pageSize);

    public int deleteCertification(Integer cid);   //通过id删除凭证信息
    public int addCertification(Certification certification);   //添加凭证信息
    public int updateCertification(Certification certification); //修改凭证信息
    public Certification findCertificationById(Integer cid);
    public List<Certification> getAll();

}
