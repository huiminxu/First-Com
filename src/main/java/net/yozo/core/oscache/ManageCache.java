package net.yozo.core.oscache;

import net.yozo.core.ManageContainer;
import net.yozo.core.front.SystemManager;
import net.yozo.services.front.area.AreaService;
import net.yozo.services.front.comment.CommentService;
import net.yozo.services.front.order.OrderService;
import net.yozo.services.front.order.bean.OrdersReport;
import net.yozo.services.front.oss.OssService;
import net.yozo.services.front.systemSetting.SystemSettingService;
import net.yozo.services.front.systemSetting.bean.SystemSetting;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.LinkedList;

/**
 * 缓存管理器。 后台项目可以通过接口程序通知该类重新加载部分或全部的缓存
 * 
 * @author huangf
 * 
 */
public class ManageCache {
	private static final Logger logger = LoggerFactory.getLogger(ManageCache.class);
	
	/**
	 * manage后台
	 */
    @Resource(name = "orderServiceFront")
	private OrderService orderService;
    @Resource(name = "commentServiceFront")
	private CommentService commentService;
    @Resource(name = "areaServiceFront")
	private AreaService areaService;
    @Resource(name = "ossServiceManage")
	private OssService ossService;
    @Autowired
    private SystemSettingService systemSettingService;
    @Autowired
    private SystemManager systemManager;
	
	public void setAreaService(AreaService areaService) {
		this.areaService = areaService;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public CommentService getCommentService() {
		return commentService;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

    /**
	 * 加载订单报表
	 */
	public void loadOrdersReport(){
		OrdersReport ordersReport = orderService.loadOrdersReport();
		if(ordersReport==null){
			ordersReport = new OrdersReport();
		}
		logger.error("SystemManager.ordersReport = " + ordersReport.toString());
        systemManager.setOrdersReport(ordersReport);
	}
	
	/**
	 * 加载定时任务列表
	 */
	public void loadTask(){

	}
	
	/**
	 * 加载全部的缓存数据
	 * @throws Exception 
	 */
	public void loadAllCache() throws Exception {
		logger.error("ManageCache.loadAllCache...");
		loadOrdersReport();
        loadSystemSetting();
		logger.error("后台缓存加载完毕!");
	}

    /**
     * 加载系统配置信息
     */
    public void loadSystemSetting() {
        SystemSetting systemSetting = systemSettingService.selectOne(new SystemSetting());
        if (systemSetting == null) {
            throw new NullPointerException("未设置本地环境变量，请管理员在后台进行设置");
        }

        //从环境变量中分解出图集来。
        if (StringUtils.isNotBlank(systemSetting.getImages())) {
            String[] images = systemSetting.getImages().split(ManageContainer.product_images_spider);
            if (systemSetting.getImagesList() == null) {
                systemSetting.setImagesList(new LinkedList<String>());
            } else {
                systemSetting.getImagesList().clear();
            }

            for (int i = 0; i < images.length; i++) {
                systemSetting.getImagesList().add(images[i]);
            }
        }
        systemManager.setSystemSetting(systemSetting);
    }

	public static void main(String[] args) {
		String str = "10280|10281|10282";
		String[] arr = str.split("\\|");
		for(int i=0;i<arr.length;i++){
			System.out.println(arr[i]);
		}
	}
}
