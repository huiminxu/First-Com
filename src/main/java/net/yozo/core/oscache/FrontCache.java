package net.yozo.core.oscache;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import net.yozo.account.dto.AccountLevel;
import net.yozo.account.dto.AccountRank;
import net.yozo.core.FrontContainer;
import net.yozo.core.KeyValueHelper;
import net.yozo.core.alipayescow.config.AlipayConfig;
import net.yozo.core.front.SystemManager;
import net.yozo.core.util.DateTimeUtil;
import net.yozo.services.front.advert.AdvertService;
import net.yozo.services.front.advert.bean.Advert;
import net.yozo.services.front.area.AreaService;
import net.yozo.services.front.area.bean.Area;
import net.yozo.services.front.attribute.AttributeService;
import net.yozo.services.front.catalog.CatalogService;
import net.yozo.services.front.catalog.bean.Catalog;
import net.yozo.services.front.comment.CommentService;
import net.yozo.services.front.commentType.CommentTypeService;
import net.yozo.services.front.commentType.bean.CommentType;
import net.yozo.services.front.express.ExpressService;
import net.yozo.services.front.express.bean.Express;
import net.yozo.services.front.indexImg.IndexImgService;
import net.yozo.services.front.indexImg.bean.IndexImg;
import net.yozo.services.front.keyvalue.KeyvalueService;
import net.yozo.services.front.keyvalue.bean.Keyvalue;
import net.yozo.services.front.navigation.NavigationService;
import net.yozo.services.front.navigation.bean.Navigation;
import net.yozo.services.front.news.NewsService;
import net.yozo.services.front.news.bean.News;
import net.yozo.services.front.notifyTemplate.NotifyTemplateService;
import net.yozo.services.front.notifyTemplate.bean.NotifyTemplate;
import net.yozo.services.front.order.OrderService;
import net.yozo.services.front.pay.PayService;
import net.yozo.services.front.pay.bean.Pay;
import net.yozo.services.front.template.TemplateService;
import net.yozo.services.front.template.bean.Template;
import net.yozo.services.front.hotquery.HotqueryService;
import net.yozo.services.front.hotquery.bean.Hotquery;
import net.yozo.services.front.recommendTemplate.PushTemplateService;
import net.yozo.services.front.recommendTemplate.bean.PushTemplate;
import net.yozo.services.front.systemSetting.SystemSettingService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.Map.Entry;

/**
 * 缓存管理器。 后台项目可以通过接口程序通知该类重新加载部分或全部的缓存
 *
 * @author huangf
 *
 */
public class FrontCache {
	private static final Logger logger = LoggerFactory.getLogger(FrontCache.class);

	/**
	 * manage后台
	 */
    @Autowired
	private KeyvalueService keyvalueService;

	@Autowired
	private TemplateService templateService;
    @Autowired
	private SystemSettingService systemSettingService;
    @Autowired
	private NewsService newsService;
    @Autowired
	private CatalogService catalogService;
    @Autowired
	private IndexImgService indexImgService;
    @Autowired
	private NavigationService navigationService;
    @Autowired
	private AttributeService attributeService;
    @Autowired
	private PayService payService;
    @Autowired
	private CommentTypeService commentTypeService;
    @Autowired
	private AreaService areaService;
    @Autowired
	private ExpressService expressService;
    @Autowired
	private AdvertService advertService;
    @Autowired
	private NotifyTemplateService notifyTemplateService;
    @Autowired
//	private OssService ossService;
	private OrderService orderService;
    @Autowired
	private CommentService commentService;
    @Autowired
	private HotqueryService hotqueryService;
	@Autowired
	private PushTemplateService recommendService;

    private static SystemManager systemManager;

	@Resource(name="accountLevelService")
	private net.yozo.account.service.AccountLevelService accountLevelService;

	@Resource(name="accountRankService")
	private net.yozo.account.service.AccountRankService accountRankService;

    @Autowired
    public void setSystemManager(SystemManager systemManager) {
        FrontCache.systemManager = systemManager;
    }

    public HotqueryService getHotqueryService() {
		return hotqueryService;
	}

	public void setHotqueryService(HotqueryService hotqueryService) {
		this.hotqueryService = hotqueryService;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public void setNotifyTemplateService(NotifyTemplateService notifyTemplateService) {
		this.notifyTemplateService = notifyTemplateService;
	}

	public void setAdvertService(AdvertService advertService) {
		this.advertService = advertService;
	}

	public void setExpressService(ExpressService expressService) {
		this.expressService = expressService;
	}

	public void setAreaService(AreaService areaService) {
		this.areaService = areaService;
	}

	public void setPayService(PayService payService) {
		this.payService = payService;
	}

	public void setCommentTypeService(CommentTypeService commentTypeService) {
		this.commentTypeService = commentTypeService;
	}

	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}

	public void setIndexImgService(IndexImgService indexImgService) {
		this.indexImgService = indexImgService;
	}

	public void setAttributeService(AttributeService attributeService) {
		this.attributeService = attributeService;
	}

	public void setSystemSettingService(
			SystemSettingService systemSettingService) {
		this.systemSettingService = systemSettingService;
	}

	public void setCatalogService(CatalogService catalogService) {
		this.catalogService = catalogService;
	}


	public void setNavigationService(NavigationService navigationService) {
		this.navigationService = navigationService;
	}

	public void setKeyvalueService(KeyvalueService keyvalueService) {
		this.keyvalueService = keyvalueService;
	}

	/**
	 * 加载key-value键值对
	 */
	public void loadKeyValue() {
		logger.info("load...");
		KeyValueHelper.load(keyvalueService.selectList(new Keyvalue()));
	}

	/**
	 * 如果类别ID是是主类别，则返回该主类别的下面所有子类别
	 * @param catalogID
	 * @return
	 */
	public static List<Catalog> loadCatalogChildren(String catalogID) {
		try {
			logger.info(">>catalogID=" + catalogID);
			if(StringUtils.isBlank(catalogID)){
				throw new NullPointerException();
			}

//			Catalog catalog = SystemManager.catalogsMap.get(catalogID);
            Catalog catalog = systemManager.getCatalogsMap().get(catalogID);
			if(catalog==null){
				throw new NullPointerException();
			}

			if(catalog.getPid().equals("0")){
				if(catalog.getChildren()==null){
					logger.info(">>主类别catalog.getChildren()=0");
				}else{
					logger.info(">>主类别catalog.getChildren()=" + catalog.getChildren().size());
				}
				//主类别
				return catalog.getChildren();
			}else{
				//子类别

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getPid(String catalogID){
		if(StringUtils.isBlank(catalogID)){
			throw new NullPointerException();
		}
        Map<String, Catalog> catalogsMap = systemManager.getCatalogsMap();
        Catalog catalog = catalogsMap.get(catalogID);
		if(catalog==null){
			throw new NullPointerException();
		}
		if(catalog.getPid().equals("0")){
			return catalog.getId();
		}else{
			catalog = catalogsMap.get(catalog.getPid());
			return catalog.getId();
		}
	}

	/**
	 * 加载目录列表,树形结构
	 * @param loadProduct 是否加载商品数据。true：加载，false:不加载
	 * @throws Exception
	 */
	public void loadCatalogs(boolean loadProduct) throws Exception {
		logger.info("load...");
		List<Catalog> catalogs = loadCatalogs2("p");
        systemManager.setCatalogs(catalogs);
		List<Catalog> catalogsArticle = loadCatalogs2("a");
        systemManager.setCatalogsArticle(catalogsArticle);
        Map<String, Catalog> catalogsMap = Maps.newHashMap();
        Map<String, Catalog> catalogsCodeMap = Maps.newHashMap();
		putToMap(systemManager.getCatalogs(), loadProduct, catalogsMap, catalogsCodeMap);
        systemManager.setCatalogsMap(catalogsMap);
        systemManager.setCatalogsCodeMap(catalogsCodeMap);
	}

	/**
	 * 将商品目录结构转化为map的形式。
	 * @param catalogs
	 * @throws Exception
	 */
	public void putToMap(List<Catalog> catalogs,boolean loadProduct, Map<String, Catalog> catalogsMap, Map<String, Catalog> catalogsCodeMap) throws Exception{
		if(catalogs==null || catalogs.size()==0){
			return;
		}
		for(int i=0;i<catalogs.size();i++){
			Catalog item = catalogs.get(i);

			if(loadProduct){
			}

			catalogsMap.put(item.getId(),item);

			if(catalogsCodeMap.get(item.getCode())!=null){
				logger.error("item.code = " + item.getCode());
				throw new Exception("错误：商品类别code重复!");
			}

			catalogsCodeMap.put(item.getCode(),item);
			if(item.getChildren()!=null && item.getChildren().size()>0){

				//递归调用
				putToMap(item.getChildren(),loadProduct, catalogsMap, catalogsCodeMap);
			}
		}
	}

	/**
	 * 原来递归的方式修改为非递归方式。
	 * 非递归方法查询商品/文章目录结构，并且自动排序。
	 * @param type
	 */
	private List<Catalog> loadCatalogs2(String type){
        List<Catalog> catalogs = Lists.newLinkedList();
		Catalog cc = new Catalog();
		cc.setType(type);
		List<Catalog> catalogsList = catalogService.selectList(cc);
		if(catalogsList!=null){

			Map<String, Catalog> map = new HashMap<String, Catalog>();
			for(Iterator<Catalog> it = catalogsList.iterator();it.hasNext();){
				Catalog item = it.next();

				if(StringUtils.isNotBlank(item.getPid()) && item.getPid().equals("0")){
					//是否在导航栏显示中文化
					if(item.getShowInNav().equals(Catalog.catalog_showInNav_y)){
						item.setShowInNavStr("是");
					}

					map.put(item.getId(), item);
					it.remove();
				}
			}

			for(Iterator<Catalog> it = catalogsList.iterator();it.hasNext();){
				Catalog item = it.next();
				if(StringUtils.isNotBlank(item.getPid())){
//							list.add(item);
					Catalog rootItem = map.get(item.getPid());
					if(rootItem!=null){
						if(rootItem.getChildren()==null){
							rootItem.setChildren(new LinkedList<Catalog>());
						}
						rootItem.getChildren().add(item);
					}
					it.remove();
				}
			}

			for(Iterator<Entry<String, Catalog>> it = map.entrySet().iterator();it.hasNext();){
				catalogs.add(it.next().getValue());
			}

			//对主类别和子类别进行排序
			Collections.sort(catalogs, new Comparator<Catalog>() {
				public int compare(Catalog o1, Catalog o2) {
					if (o1.getOrder1() > o2.getOrder1()) {
						return 1;
					} else if (o1.getOrder1() < o2.getOrder1()) {
						return -1;
					}
					return 0;
				}
			});

			for(int i=0;i<catalogs.size();i++){
				if(catalogs.get(i).getChildren()==null){
					continue;
				}
				Collections.sort(catalogs.get(i).getChildren(), new Comparator<Catalog>() {
					public int compare(Catalog o1, Catalog o2) {
						if (o1.getOrder1() > o2.getOrder1()) {
							return 1;
						} else if (o1.getOrder1() < o2.getOrder1()) {
							return -1;
						}
						return 0;
					}
				});
			}
		}
        return catalogs;
	}

	/**
	 * 加载门户滚动图片列表
	 */
	public void loadIndexImgs() {
		//logger.info("loadIndexImgs...");
		IndexImg c = new IndexImg();
		List<IndexImg> indexImages = indexImgService.selectList(c);
        systemManager.setIndexImages(indexImages);
	}

	/**
	 * 加载表情包列表
	 */
	public void loadFaceTemplate() {
		//logger.info("loadFaceTemplate...");
		Template template = new Template();
		template.setTop(3);
		template.setName("biaoqingbao");
		List<Template> faceTemplates = templateService.selectIndexList(template);
		systemManager.setFaceTemplateList(faceTemplates);

		template.setTop(4);
		template.setName("biaoqingbao");
		List<Template> sfaceTemplates = templateService.selectIndexList(template);
		systemManager.setFaceTemplateList(faceTemplates);

	}

	/**
	 * 加载ae列表
	 */
	public void loadAETemplate() {
		logger.debug("loadAeTemplate...");
		Template template = new Template();
		template.setTop(4);
		template.setName("AE");
		List<Template> aeTemplates = templateService.selectIndexList(template);
		systemManager.setAeTemplateList(aeTemplates);
	}

	/**
	 * 加载门户滚动图片列表
	 */
	public void loadPEW() {
		Template template = new Template();
		template.setTop(8);
		loadPPTData(template);
		loadWordData(template);
		loadExcelData(template);
	}
	private void loadPPTData(Template template){
		//最新推荐 最热下载 最新发布
		template.setName("PPT");
		template.setOrderBy(1);
		List<Template> templates1 = templateService.selectIndexList(template);
		systemManager.setPptLatestRecommendList(templates1);
		template.setOrderBy(2);
		List<Template> templates2 = templateService.selectIndexList(template);
		systemManager.setPptHotDownList(templates2);
		template.setOrderBy(3);
		List<Template> templates3 = templateService.selectIndexList(template);
		systemManager.setPptLatestList(templates3);
	}

	private void loadWordData(Template template){
		//最新推荐 最热下载 最新发布
		template.setName("WORD");
		template.setOrderBy(1);
		List<Template> templates1 = templateService.selectIndexList(template);
		systemManager.setWordLatestRecommendList(templates1);
		template.setOrderBy(2);
		List<Template> templates2 = templateService.selectIndexList(template);
		systemManager.setWordHotDownList(templates2);
		template.setOrderBy(3);
		List<Template> templates3 = templateService.selectIndexList(template);
		systemManager.setWordLatestList(templates3);
	}

	private void loadExcelData(Template template){
		//最新推荐 最热下载 最新发布
		template.setName("EXCEL");
		template.setOrderBy(1);
		List<Template> templates1 = templateService.selectIndexList(template);
		systemManager.setExcelLatestRecommendList(templates1);
		template.setOrderBy(2);
		List<Template> templates2 = templateService.selectIndexList(template);
		systemManager.setExcelHotDownList(templates2);
		template.setOrderBy(3);
		List<Template> templates3 = templateService.selectIndexList(template);
		systemManager.setExcelLatestList(templates3);
	}

	// 加载商品
	private List<Template> loadTemplates(int type) {
		Template p = new Template();
		p.setTop(8);

		return templateService.selectList(p);
	}

	/**
	 * 加载物流列表
	 */
	private void loadExpress(){
		List<Express> expressList = expressService.selectList(new Express());
        Map<String, Express> expressMap = Maps.newHashMap();
		if(expressList!=null && expressList.size()>0){
			for(int i=0;i<expressList.size();i++){
				Express item = expressList.get(i);
				expressMap.put(item.getCode(), item);
			}
		}
        systemManager.setExpressMap(expressMap);
	}

	/**
	 * 加载广告列表
	 */
	public void loadAdvertList(){
		Advert advert = new Advert();
		advert.setStatus(Advert.advert_status_y);
		List<Advert> advertList = advertService.selectList(advert);
        Map<String, Advert> advertMap = Maps.newHashMap();
		if(advertList!=null && advertList.size()>0){
			for(int i=0;i<advertList.size();i++){
				Advert item = advertList.get(i);
				advertMap.put(item.getCode(), item);
			}
		}
        systemManager.setAdvertMap(advertMap);
	}


    /**
     * 加载省市区数据
     */
    public void loadArea(){
        logger.debug("loadArea...");
        Area area = new Area();
        List<Area> areas = areaService.selectList(area);
        List<Area> rootAreas = Lists.newArrayList();
        for(Area a : areas){
            if("0".equals(a.getPcode())){
                rootAreas.add(a);
            }
        }
        if(rootAreas.size() == 0){
            return ;
        }

        for(Area a : rootAreas){
            getAreaByDigui2(a, areas);
        }

        Map<String, Area> map = new TreeMap<String, Area>();
        for(Area a : rootAreas){
            map.put(a.getCode(), a);
        }
        systemManager.setAreaMap(map);
    }

	/**
	 * 递归加载省份下的：城市、区域、以后还会有街道的数据
	 * @param item
     * @param areas 所有的地区列表
	 */
	private void getAreaByDigui2(Area item, final List<Area> areas){
		List<Area> children = Lists.newArrayList();
        for(Area a : areas) {
            if(item.getCode().equals(a.getPcode())){
                children.add(a);
            }
        }

		item.setChildren(children);
        if(children.size() == 0){
            return ;
        }

		for(Area a : children){
			getAreaByDigui2(a, areas);
		}
	}
	/**
	 * 读取本地区域数据
	 */
	public void readJsonArea(){
		long start = System.currentTimeMillis();
		try {
			String path = FrontCache.class.getResource("/").getPath();
			logger.info("path = " + path);
			File file = new File(path + "__area.json");
			logger.info(file.getAbsolutePath());
			List<String> list = FileUtils.readLines(file, "utf-8");
			logger.info("list.size()="+list.size());

			Map<String, Area> areaMap = JSON.parseObject(list.get(0),new TypeReference<Map<String,Area>>(){});
            systemManager.setAreaMap(areaMap);
		} catch (IOException e) {
			e.printStackTrace();
		}

		logger.info("readJsonArea time = " + (System.currentTimeMillis() - start));
	}

	/**
	 * 加载邮件模板列表
	 */
	public void loadNotifyTemplate(){
		List<NotifyTemplate> list = notifyTemplateService.selectList(null);
        Map<String, NotifyTemplate> notifyTemplateMap = Maps.newHashMap();
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				NotifyTemplate item = list.get(i);
				notifyTemplateMap.put(item.getCode(), item);
			}
		}
        systemManager.setNotifyTemplateMap(notifyTemplateMap);
	}

	/**
	 * 加载热门查询列表
	 */
	public void loadHotquery(){
		List<Hotquery> hotqueryList = hotqueryService.selectList(new Hotquery());
        systemManager.setHotqueryList(hotqueryList);
	}

	/**
	 * 加载注册页推荐模板列表
	 */
	public void loadRecommendTemplate(){
		List<PushTemplate> templateList = recommendService.selectList(new PushTemplate());
		systemManager.setPushTemplates(templateList);
	}

	public void loadAccountLevel(){
		List<AccountLevel> accountLevelList = accountLevelService.selectAccountLevel();
		systemManager.setAccountLevelList(accountLevelList);
	}

	public void loadAccountRank(){
		List<AccountRank> accountRankList = accountRankService.selectAccountRank();
		systemManager.setAccountRankList(accountRankList);
	}

	/**
	 * 加载全部的缓存数据
	 * @throws Exception
	 */
	public void loadAllCache() throws Exception {
		logger.info("loadAllCache...");
		loadHotquery();
		loadCatalogs(true);
		loadIndexImgs();
		loadFaceTemplate();
		loadAETemplate();
		loadKeyValue();
		loadRecommendTemplate();
		loadPEW();
		loadDefaultCatalog();
		loadArea();
		loadNotifyTemplate();
		loadAccountRank();
		loadAccountLevel();
		logger.info("前台缓存加载完毕!");
	}

	private void loadDefaultCatalog() {
		systemManager.setDefaultCatalog(systemManager.getCatalogs().get(0));
	}

	public static void main(String[] args) {
		String str = "10280|10281|10282";
		String[] arr = str.split("\\|");
		for(int i=0;i<arr.length;i++){
			System.out.println(arr[i]);
		}
	}
}
