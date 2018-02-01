package net.yozo.account.service;

import net.yozo.account.dto.AccountInfo;
import net.yozo.account.mapper.ext.TAccountInfoExtMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by yozo on 2017-11-10.
 */
@Component("accountInfoServicenew")
public class AccountInfoService {
    @Autowired
    private TAccountInfoExtMapper tAccountInfoExtMapper;

    public AccountInfo selectAccountInfo(AccountInfo example){
        return tAccountInfoExtMapper.selectAccountInfo(example);
    }

    public void updateGrowthValue(AccountInfo example){
        AccountInfo accountInfo=tAccountInfoExtMapper.selectAccountInfo(example);
        if(accountInfo!=null){
            accountInfo.setGrowthValue(accountInfo.getGrowthValue()+example.getAddGrowthValue());
            tAccountInfoExtMapper.updateGrowthValue(accountInfo);
        }else{
            example.setGrowthValue(example.getAddGrowthValue());
            tAccountInfoExtMapper.insert(example);
        }
    }

    public int insert(AccountInfo example){
        return tAccountInfoExtMapper.insert(example);
    }

    public AccountInfo select(AccountInfo example){
        return tAccountInfoExtMapper.select(example);
    }

    public void updateScore(AccountInfo example){
        tAccountInfoExtMapper.updateScore(example);
    }

    public AccountInfo selectByAccount(Integer accountId){
        return tAccountInfoExtMapper.selectByAccount(accountId);
    }
}
