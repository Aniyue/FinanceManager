package com.itheima.service;
import com.itheima.po.PageInfo;
import com.itheima.po.Region;

import java.util.List;

/**
 * 用户Service层接口
 */
public interface RegionService {

    //分页查询
    public PageInfo<Region> findPageInfo(Integer r_regionkey, String r_name,
                                         Integer pageIndex, Integer pageSize);

    public int deleteRegion(Integer r_regionkey);   //通过id删除地区信息
    public int addRegion(Region region);   //添加地区信息
    public int updateRegion(Region region); //修改地区信息
    public Region findRegionById(Integer r_regionkey);
    public List<Region> getAll();

}
