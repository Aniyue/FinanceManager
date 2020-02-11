package com.itheima.dao;

import com.itheima.po.Certification;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 管理员DAO层接口
 */
public interface CertificationDao {
    /**
     * 进行分页查询
     */

    //获取总条数
    public Integer totalCount(@Param("cid") Integer cid, @Param("cname") String cname);
    //获取用户列表
    public List<Certification> getCertificationList(@Param("cid") Integer cid, @Param("cname") String cname, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    public int deleteCertification(Integer cid);   //删除地区信息
    public int addCertification(Certification certification);   //添加地区信息
    public int updateCertification(Certification certification); //修改地区信息
    public Certification findCertificationById(Integer cid);
    public List<Certification> getAll();
}
