package net.yozo.core.task;

import net.yozo.core.front.SystemManager;
import net.yozo.core.oscache.FrontCache;
import net.yozo.core.oscache.ManageCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * 前台缓存定时更新
 * 
 * @author huangf
 * 
 */
@Component
public class ManageCacheTask {
	private static final org.apache.logging.log4j.Logger logger = org.apache.logging.log4j.LogManager.getLogger(ManageCacheTask.class);
//	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	@Autowired
	private FrontCache frontCache;


	@SuppressWarnings("unchecked")
	@Scheduled(cron = "0 0/10 * * * ?")
	public void run() {
		try {
			frontCache.loadAllCache();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public FrontCache getFrontCache() {
		return frontCache;
	}

	public void setFrontCache(FrontCache frontCache) {
		this.frontCache = frontCache;
	}
}
