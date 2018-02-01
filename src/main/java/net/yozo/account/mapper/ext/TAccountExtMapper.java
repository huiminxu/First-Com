package net.yozo.account.mapper.ext;

import net.yozo.account.entity.TAccount;

/**
 * Created by t on 2017/11/15.
 */
public interface TAccountExtMapper {
    TAccount selectByPrimaryKey(Integer id);
}
