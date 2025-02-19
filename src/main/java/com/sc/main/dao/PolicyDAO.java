package com.sc.main.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PolicyDAO {   
    String getPolicyContent(@Param("policyName") String policyName);
}