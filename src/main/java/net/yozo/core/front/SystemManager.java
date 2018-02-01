package net.yozo.core.front;

import com.google.common.collect.Lists;
import net.yozo.account.dto.AccountLevel;
import net.yozo.account.dto.AccountRank;
import net.yozo.core.cache.CacheProvider;
import net.yozo.core.cache.SimpleCacheProvider;
import net.yozo.core.listener.SystemListener;
import net.yozo.services.front.advert.bean.Advert;
import net.yozo.services.front.area.bean.Area;
import net.yozo.services.front.attribute.bean.Attribute;
import net.yozo.services.front.catalog.bean.Catalog;
import net.yozo.services.front.express.bean.Express;
import net.yozo.services.front.indexImg.bean.IndexImg;
import net.yozo.services.front.navigation.bean.Navigation;
import net.yozo.services.front.news.bean.News;
import net.yozo.services.front.notifyTemplate.bean.NotifyTemplate;
import net.yozo.services.front.template.bean.Template;
import net.yozo.services.front.hotquery.bean.Hotquery;
import net.yozo.services.front.order.bean.OrdersReport;
import net.yozo.services.front.oss.bean.AliyunOSS;
import net.yozo.services.front.recommendTemplate.bean.PushTemplate;
import net.yozo.services.front.systemSetting.bean.SystemSetting;
import org.apache.commons.lang.StringUtils;

import javax.annotation.PostConstruct;
import java.io.IOException;
import java.io.Serializable;
import java.util.*;


/**
 * 系统管理类.
 * 1、负责管理system.properties的东东
 * 2、负责缓存管理
 * @author huangf
 */
public class SystemManager {
	private static final org.apache.logging.log4j.Logger logger = org.apache.logging.log4j.LogManager.getLogger(SystemManager.class);
	private static Properties p = new Properties();
    private static CacheProvider cacheProvider = new SimpleCacheProvider();
	private static SystemManager instance;

    @PostConstruct
    public void afterPropertiesSet(){
        instance = this;
    }

    private SystemSetting systemSetting;//系统设置
	private List<PushTemplate> pushTemplates;



    private List<Template> pptLatestRecommendList;
    private List<Template> pptHotDownList;
    private List<Template> pptLatestList;

    private Catalog defaultCatalog;

	private List<Template> wordLatestRecommendList;
    private List<Template> wordHotDownList;
    private List<Template> wordLatestList;

    private List<Template> excelLatestRecommendList;
    private List<Template> excelHotDownList;
    private List<Template> excelLatestList;
    private List<Template> faceTemplateList;

    private List<Template> sfaceTemplateList;
    private List<Template> aeTemplateList;

    private List<AccountLevel> accountLevelList;
    private List<AccountRank> accountRankList;

    private Map<String,News> newsMap = new HashMap<String, News>();//文章map；key:code

	private static Map<String,String> manageExpressMap = new HashMap<String, String>();//后台发货页面物流公司列表

    public static SystemManager getInstance(){
        return instance;
    }

    static {
		init();
	}
	private static void init(){
		try {
			p.load(SystemListener.class
					.getResourceAsStream("/system.properties"));
			logger.info(p.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}

        manageExpressMap.put("shunfeng", "顺风快递");
        manageExpressMap.put("ems", "EMS");
        manageExpressMap.put("shentong", "申通E物流");
        manageExpressMap.put("yuantong", "圆通速递");
        manageExpressMap.put("zhongtong", "中通速递");
        manageExpressMap.put("zhaijisong", "宅急送");
        manageExpressMap.put("yunda", "韵达快运");
        manageExpressMap.put("tiantian", "天天快递");
        manageExpressMap.put("lianbangkuaidi", "联邦快递");
        manageExpressMap.put("huitongkuaidi", "汇通快运");
	}
	
	public String getProperty(String key){
		return p.getProperty(key);
	}
	
	private Random random = new Random();
	
	/**
	 * 随机从图集里面选取一张图片
	 * @return
	 */
	public String getImageRandom(){
        SystemSetting systemSetting = getSystemSetting();
		if(systemSetting==null || systemSetting.getImagesList()==null || systemSetting.getImagesList().size()==0){
			logger.error("系统未设置图集，但广告位却设置了图集优先显示。请管理员立刻设置图集。");
			return null;
		}
		
		int n = random.nextInt(systemSetting.getImagesList().size());
		
		return systemSetting.getImageRootPath()+systemSetting.getImagesList().get(n);
	}

	/**
	 * 获取网站上下文路径/house
	 * 正式环境和测试环境获取上下文不一样
	 * @param request
	 * @return
	 */
//	public static String getContextPath(HttpServletRequest request){
//		if(Boolean.valueOf(getInstance().get("is_www"))){
//			return SystemManager.getInstance().get("contextPath");
//		}
//		return request.getContextPath();
//	}
	
	
	/**
	 * 根据类别ID获取该类别下的所有ID集合
	 * @param catalogID
	 * @return
	 */
	public List<String> getCatalogsById(String catalogID) {
		if(StringUtils.isBlank(catalogID)){
			return null;
		}

        List<Catalog> catalogs = getCatalogs();
        if(catalogs ==null || catalogs.size()==0){
			return null;
		}
		
		List<String> list = new LinkedList<String>();
		Catalog cataInfo = getCatalogsMap().get(catalogID);
		if(cataInfo.getPid().equals("0")){
			//主类
			for(int i=0;i<cataInfo.getChildren().size();i++){
				list.add(cataInfo.getChildren().get(i).getId());
			}
		}else{
			//子类
			list.add(catalogID);
		}
		return list;
	}
	
    //应用缓存管理

    public CacheProvider getCacheProvider() {
        return cacheProvider;
    }

    public void setCacheProvider(CacheProvider cacheProvider) {
        SystemManager.cacheProvider = cacheProvider;
    }

    private static String buildKey(String key) {
        return "SystemManager." + StringUtils.trimToEmpty(key);
    }
    private static void putCacheObject(String key, Serializable cacheObject){
        String key1 = buildKey(key);
        if(cacheObject == null){
            cacheProvider.remove(key1);
        } else {
            cacheProvider.put(key1, cacheObject);
        }
    }
    private static <T extends Serializable> T getCacheObject(String key){
        return (T)cacheProvider.get(buildKey(key));
    }

    /**
     * 产品目录列表
     * @return
     */
    public List<Catalog> getCatalogs() {
        return getCacheObject("catalogs");
    }

    public void setCatalogs(List<Catalog> catalogs) {
//        this.catalogs = catalogs;
        putCacheObject("catalogs", (Serializable)(catalogs));
    }

    /**
     * 文章目录列表
     * @return
     */
    public List<Catalog> getCatalogsArticle() {
        return getCacheObject("catalogsArticle");
    }

    public void setCatalogsArticle(List<Catalog> catalogsArticle) {
        putCacheObject("catalogsArticle", (Serializable)catalogsArticle);
    }

    /**
     * 属性集合
     * @return
     */
    public List<Attribute> getAttrs() {
        return getCacheObject("attrs");
    }

    public void setAttrs(List<Attribute> attrs) {
        putCacheObject("attrs", (Serializable)attrs);
    }

    /**
     * 文章列表
     * @return
     */
    public Map<String, News> getNewsMap() {
        return getCacheObject("newsMap");
    }

    public void setNewsMap(Map<String, News> newsMap) {
        putCacheObject("newsMap", (Serializable)newsMap);
    }

    /**
     * 属性集合map
     * @return
     */
    public Map<String, Attribute> getAttrsMap() {
        return getCacheObject("attrsMap");
    }

    public void setAttrsMap(Map<String, Attribute> attrsMap) {
        putCacheObject("attrsMap", (Serializable)attrsMap);
    }

    //系统设置
    public SystemSetting getSystemSetting() {
        return getCacheObject("systemSetting");
    }

    public void setSystemSetting(SystemSetting systemSetting) {
        putCacheObject("systemSetting", systemSetting);
    }

    /**
     * 后台首页/统计数据
     * @return
     */
    public OrdersReport getOrdersReport() {
        return getCacheObject("ordersReport");
    }

    public void setOrdersReport(OrdersReport ordersReport) {
        putCacheObject("ordersReport", ordersReport);
    }

    /**
     * 会员等级列表
     * @return
     */
    public Map<String, AccountRank> getAccountRankMap() {
        return getCacheObject("accountRankMap");
    }

    public void setAccountRankMap(Map<String, AccountRank> accountRankMap) {
        putCacheObject("accountRankMap", (Serializable)accountRankMap);
    }

    /**
     * 邮件模板列表
     * @return
     */
    public Map<String, NotifyTemplate> getNotifyTemplateMap() {
        return getCacheObject("notifyTemplateMap");
    }

    public void setNotifyTemplateMap(Map<String, NotifyTemplate> notifyTemplateMap) {
        putCacheObject("notifyTemplateMap", (Serializable)notifyTemplateMap);
    }

    /**
     * 支付宝卖家账号
     * @return
     */
    public String getAlipayConfig() {
        return getCacheObject("alipayConfig");
    }

    public void setAlipayConfig(String alipayConfig) {
        putCacheObject("alipayConfig", alipayConfig);
    }

    /**
     * 启用的评论插件代号
     * @return
     */
    public String getCommentTypeCode() {
        return getCacheObject("commentTypeCode");
    }

    public void setCommentTypeCode(String commentTypeCode) {
        putCacheObject("commentTypeCode", commentTypeCode);
    }

    /**
     * 热门查询列表
     * @return
     */
    public List<Hotquery> getHotqueryList() {
        return getCacheObject("hotqueryList");
    }

    public void setHotqueryList(List<Hotquery> hotqueryList) {
        putCacheObject("hotqueryList", (Serializable)(hotqueryList));
    }

    /**
     * 目录的MAP形式，具有层级关系。key：主类别ID，value：主类别对象，可以通过该对象的getChildren()方法获取该主类别的所有的子类别集合
     * @return
     */
    public Map<String, Catalog> getCatalogsMap() {
        return getCacheObject("catalogsMap");
    }

    public void setCatalogsMap(Map<String, Catalog> catalogsMap) {
        putCacheObject("catalogsMap", (Serializable)catalogsMap);
    }

    /**
     * 目录的MAP形式，具有层级关系。key：主类别code，value：主类别对象，可以通过该对象的getChildren()方法获取该主类别的所有的子类别集合
     * @return
     */
    public Map<String, Catalog> getCatalogsCodeMap() {
        return getCacheObject("catalogsCodeMap");
    }

    public void setCatalogsCodeMap(Map<String, Catalog> catalogsCodeMap) {
        putCacheObject("catalogsCodeMap", (Serializable)catalogsCodeMap);
    }

    /**
     * 友情链接
     * @return
     */
    public List<Navigation> getNavigations() {
        return getCacheObject("navigations");
    }

    public void setNavigations(List<Navigation> navigations) {
        putCacheObject("navigations", (Serializable)(navigations));
    }

    /**
     * 门户滚动图片
     * @return
     */
    public List<IndexImg> getIndexImages() {
        return getCacheObject("indexImages");
    }

    public void setIndexImages(List<IndexImg> indexImages) {
        putCacheObject("indexImages", (Serializable)(indexImages));
    }

    /**
     * 文章目录。文章目前只有一级目录
     * @return
     */
    public List<Catalog> getNewsCatalogs() {
        return getCacheObject("newsCatalogs");
    }

    public void setNewsCatalogs(List<Catalog> newsCatalogs) {
        putCacheObject("newsCatalogs", (Serializable)(newsCatalogs));
    }

    /**
     * 系统通知
     * @return
     */
    public List<News> getNoticeList() {
        return getCacheObject("noticeList");
    }

    public void setNoticeList(List<News> noticeList) {
        putCacheObject("noticeList", (Serializable)(noticeList));
    }

    /**
     * 省市区集合
     * @return
     */
    public Map<String, Area> getAreaMap() {
        return getCacheObject("areaMap");
    }

    public void setAreaMap(Map<String, Area> areaMap) {
        putCacheObject("areaMap", (Serializable)areaMap);
    }

    /**
     * 前台订单支付页面--物流列表
     * @return
     */
    public Map<String, Express> getExpressMap() {
        return getCacheObject("expressMap");
    }

    public void setExpressMap(Map<String, Express> expressMap) {
//        this.expressMap = expressMap;
        putCacheObject("expressMap", (Serializable)(expressMap));
    }

    /**
     * 广告列表
     * @return
     */
    public Map<String, Advert> getAdvertMap() {
//        return advertMap;
        return getCacheObject("advertMap");
    }

    public void setAdvertMap(Map<String, Advert> advertMap) {
//        this.advertMap = advertMap;
        putCacheObject("advertMap", (Serializable)advertMap);
    }

    /**
     * 后台发货页面物流公司列表
     * @return
     */
    public Map<String, String> getManageExpressMap() {
//        return manageExpressMap;
        Map<String,String> cachedMap = getCacheObject("manageExpressMap");
        if(cachedMap != null){
            return cachedMap;
        }
        return SystemManager.manageExpressMap;
    }

    public void setManageExpressMap(Map<String, String> manageExpressMap) {
        putCacheObject("manageExpressMap", Lists.newArrayList(manageExpressMap));
    }

    /**
     * 阿里云存储的配置信息
     * @return
     */
    public AliyunOSS getAliyunOSS() {
//        return aliyunOSS;
        return getCacheObject("aliyunOSS");
    }

    public void setAliyunOSS(AliyunOSS aliyunOSS) {
//        this.aliyunOSS = aliyunOSS;
        putCacheObject("aliyunOSS", aliyunOSS);
    }

    public List<Template> getSfaceTemplateList() {
        return sfaceTemplateList;
    }

    public void setSfaceTemplateList(List<Template> sfaceTemplateList) {
        this.sfaceTemplateList = sfaceTemplateList;
    }


    /////////////////后台类目查询的JSON字符串缓存///////////////////
    /**
     * 商品类目JSON字符串缓存
     * @return
     */
    public String getProductCatalogJsonStr() {
//        return productCatalogJsonStr;
        return getCacheObject("productCatalogJsonStr");
    }

    public void setProductCatalogJsonStr(String productCatalogJsonStr) {
//        this.productCatalogJsonStr = productCatalogJsonStr;
        putCacheObject("productCatalogJsonStr", productCatalogJsonStr);
    }

    /**
     * 缓存类目JSON字符串缓存
     * @return
     */
    public String getArticleCatalogJsonStr() {
//        return articleCatalogJsonStr;
        return getCacheObject("articleCatalogJsonStr");
    }

    public void setArticleCatalogJsonStr(String articleCatalogJsonStr) {
//        this.articleCatalogJsonStr = articleCatalogJsonStr;
        putCacheObject("articleCatalogJsonStr", articleCatalogJsonStr);
    }

    public List<Template> getPptLatestRecommendList() {
        return pptLatestRecommendList;
    }

    public void setPptLatestRecommendList(List<Template> pptLatestRecommendList) {
        this.pptLatestRecommendList = pptLatestRecommendList;
    }

    public List<Template> getPptHotDownList() {
        return pptHotDownList;
    }

    public void setPptHotDownList(List<Template> pptHotDownList) {
        this.pptHotDownList = pptHotDownList;
    }

    public List<Template> getPptLatestList() {
        return pptLatestList;
    }

    public void setPptLatestList(List<Template> pptLatestList) {
        this.pptLatestList = pptLatestList;
    }

    public List<Template> getWordLatestRecommendList() {
        return wordLatestRecommendList;
    }

    public void setWordLatestRecommendList(List<Template> wordLatestRecommendList) {
        this.wordLatestRecommendList = wordLatestRecommendList;
    }

    public List<Template> getWordHotDownList() {
        return wordHotDownList;
    }

    public void setWordHotDownList(List<Template> wordHotDownList) {
        this.wordHotDownList = wordHotDownList;
    }

    public List<Template> getWordLatestList() {
        return wordLatestList;
    }

    public void setWordLatestList(List<Template> wordLatestList) {
        this.wordLatestList = wordLatestList;
    }

    public List<Template> getExcelLatestRecommendList() {
        return excelLatestRecommendList;
    }

    public void setExcelLatestRecommendList(List<Template> excelLatestRecommendList) {
        this.excelLatestRecommendList = excelLatestRecommendList;
    }

    public List<Template> getExcelHotDownList() {
        return excelHotDownList;
    }

    public void setExcelHotDownList(List<Template> excelHotDownList) {
        this.excelHotDownList = excelHotDownList;
    }

    public List<Template> getExcelLatestList() {
        return excelLatestList;
    }

    public void setExcelLatestList(List<Template> excelLatestList) {
        this.excelLatestList = excelLatestList;
    }

    public List<Template> getFaceTemplateList() {
        return faceTemplateList;
    }

    public void setFaceTemplateList(List<Template> faceTemplateList) {
        this.faceTemplateList = faceTemplateList;
    }

    public List<Template> getAeTemplateList() {
        return aeTemplateList;
    }

    public void setAeTemplateList(List<Template> aeTemplateList) {
        this.aeTemplateList = aeTemplateList;
    }

    public List<PushTemplate> getPushTemplates() {
		return pushTemplates;
	}

	public void setPushTemplates(List<PushTemplate> pushTemplates) {
		this.pushTemplates = pushTemplates;
	}

	public Catalog getDefaultCatalog() {
		return defaultCatalog;
	}

	public void setDefaultCatalog(Catalog defaultCatalog) {
		this.defaultCatalog = defaultCatalog;
	}

    public List<AccountLevel> getAccountLevelList() {
        return accountLevelList;
    }

    public void setAccountLevelList(List<AccountLevel> accountLevelList) {
        this.accountLevelList = accountLevelList;
    }

    public List<AccountRank> getAccountRankList() {
        return accountRankList;
    }

    public void setAccountRankList(List<AccountRank> accountRankList) {
        this.accountRankList = accountRankList;
    }
}
