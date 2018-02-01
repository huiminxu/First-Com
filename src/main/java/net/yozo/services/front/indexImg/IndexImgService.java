/**
 * 2012-7-8
 * jqsl2012@163.com
 */
package net.yozo.services.front.indexImg;

import net.yozo.core.Services;
import net.yozo.services.front.indexImg.bean.IndexImg;

import java.util.List;


/**
 * @author huangf
 */
public interface IndexImgService extends Services<IndexImg> {

	/**
	 * 加载图片显示到门户
	 * @param i
	 */
	List<IndexImg> getImgsShowToIndex(int i);

}
