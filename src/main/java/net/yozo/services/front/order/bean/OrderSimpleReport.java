package net.yozo.services.front.order.bean;

import net.yozo.core.dao.page.ClearBean;

/**
 * 订单简单报表信息
 * 
 * @author jqsl2012@163.com
 * 
 */
public class OrderSimpleReport implements ClearBean {
	private int orderPayCount;
	private int orderWaitCount;

	public int getOrderPayCount() {
		return orderPayCount;
	}

	public void setOrderPayCount(int orderPayCount) {
		this.orderPayCount = orderPayCount;
	}

	@Override
	public String toString() {
		return "OrderSimpleReport{" +
				"orderPayCount=" + orderPayCount +
				", orderWaitCount=" + orderWaitCount +
				'}';
	}

	public int getOrderWaitCount() {
		return orderWaitCount;
	}

	public void setOrderWaitCount(int orderWaitCount) {
		this.orderWaitCount = orderWaitCount;
	}

	public void clear() {
		this.orderWaitCount = 0;
		this.orderPayCount = 0;
	}

}
