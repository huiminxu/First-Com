package net.yozo.account.service;

import net.yozo.account.dto.AccountLevel;
import net.yozo.account.mapper.ext.TAccountLevelExtMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by yozo on 2017-11-10.
 */
@Component("accountLevelService")
public class AccountLevelService {
    @Autowired
    private TAccountLevelExtMapper tAccountLevelExtMapper;

    public List selectAccountLevel(){
        return tAccountLevelExtMapper.selectAccountLevel();
    }
}
