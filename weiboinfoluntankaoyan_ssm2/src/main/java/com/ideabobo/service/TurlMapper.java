package com.ideabobo.service;

import com.ideabobo.model.Turl;

public interface TurlMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Turl record);

    int insertSelective(Turl record);

    Turl selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Turl record);

    int updateByPrimaryKey(Turl record);
}