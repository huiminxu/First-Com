package net.yozo.account.mapper.ext;

import net.yozo.account.dto.AccountInfo;
import net.yozo.account.entity.TAccountInfo;

/**
 * Created by yozo on 2017-11-10.
 */
public interface TAccountInfoExtMapper {
    AccountInfo selectAccountInfo(AccountInfo example);

    int updateGrowthValue(AccountInfo example);

    int insert(AccountInfo example);

    AccountInfo select(AccountInfo example);

    int updateScore(AccountInfo example);

    AccountInfo selectByAccount(Integer accountId);
}
