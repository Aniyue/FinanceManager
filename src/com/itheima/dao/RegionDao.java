package com.itheima.dao;

import com.itheima.po.Region;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 管理员DAO层接口
 */
public interface RegionDao {
    /**
     * 进行分页查询
     */

    //获取总条数
    public Integer totalCount(@Param("r_regionkey") Integer r_regionkey, @Param("r_name") String r_name);
    //获取用户列表
    public List<Region> getRegionList(@Param("r_regionkey") Integer r_regionkey, @Param("r_name") String r_name, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    public int deleteRegion(Integer r_regionkey);   //删除地区信息
    public int addRegion(Region region);   //添加地区信息
    public int updateRegion(Region region); //修改地区信息
    public Region findRegionById(Integer r_regionkey);
    public List<Region> getAll();
}
