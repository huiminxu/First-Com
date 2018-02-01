package net.yozo.account.service;

import net.yozo.account.mapper.ext.TAccountRankExtMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by yozo on 2017-11-10.
 */
@Component("accountRankService")
public class AccountRankService {
    @Autowired
    private TAccountRankExtMapper tAccountRankExtMapper;

    public List selectAccountRank(){
        return tAccountRankExtMapper.selectAccountRank();
    }
}
