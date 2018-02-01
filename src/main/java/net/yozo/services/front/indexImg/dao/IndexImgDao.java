/**
 * 2012-7-8
 * jqsl2012@163.com
 */
package net.yozo.services.front.indexImg.dao;

import net.yozo.core.DaoManager;
import net.yozo.services.front.indexImg.bean.IndexImg;

import java.util.List;


public interface IndexImgDao extends DaoManager<IndexImg> {

	/**
	 * @param i
	 * @return
	 */
	List<IndexImg> getImgsShowToIndex(int i);

}
