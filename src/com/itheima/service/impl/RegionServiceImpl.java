package com.itheima.service.impl;


import com.itheima.dao.RegionDao;
import com.itheima.po.PageInfo;
import com.itheima.po.Region;
import com.itheima.service.RegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户Service接口实现类
 */
@Service("regionService")
@Transactional
public class RegionServiceImpl implements RegionService {
    // 注入regionDao
    @Autowired
    private RegionDao regionDao;


    //分页查询
    @Override
    public PageInfo<Region> findPageInfo(Integer r_regionkey,String r_name,
                                         Integer pageIndex, Integer pageSize) {
        PageInfo<Region> pi = new PageInfo<Region>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = regionDao.totalCount(r_regionkey,r_name);
        if (totalCount>0){
            pi.setTotalCount(totalCount);
            //每一页显示学生信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Region> regionList =	regionDao.getRegionList(r_regionkey,r_name,
                    (pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
            pi.setList(regionList);
        }
        return pi;
    }

    @Override
    public List<Region> getAll(){
        List<Region> regionList = regionDao.getAll();
        return regionList;
    }

    //通过id删除地区信息
    @Override
    public int deleteRegion(Integer r_regionkey) {
        return regionDao.deleteRegion(r_regionkey);
    }
    //添加地区信息
    @Override
    public  int addRegion(Region region) {
        return regionDao.addRegion(region);
    }
    //修改地区信息
    @Override
    public int updateRegion(Region region) { return regionDao.updateRegion(region); }

    @Override
    public Region findRegionById (Integer r_regionkey){
        Region r = regionDao.findRegionById(r_regionkey);
        return  r;
    }


}
