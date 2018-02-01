package net.yozo.services.common;

import net.yozo.core.dao.QueryModel;

import java.io.Serializable;
import java.util.Date;

public class Template  extends QueryModel implements Serializable {
    private String id;
    private String catalogID;  // 模板关联大类的ID
    private String name;   // 模板名称
    private String author;    // 模板作者
    private String price;    // 模板原价
    private String nowPrice;  // 模板现价
    private String fileUrl;   // 模板存放的全路径


    private String videoUrl;   // 视频存放的全路径
    private int score;   // 模板积分
    private String isTop;     // 是否置顶
    private String isRecommend;      // 是否推荐
    private String description;      // 模板描述
    private int downloadNum;    // 模板下载次数
    private int shareNum;      // 模板分享次数
    private int collectNum;   // 模板收藏次数
    private int browseNum;   // 模板浏览次数
    private int sellCount;  // 模板销量
    private String imgUrl;    // 模板主图的存放地址
    private String shrinkUrl;   //缩略图的存放地址
    private int showModel = 1;   // 模板展示方式  1(16:9)    2(4:3)
    private int source;   //  模板来源   1 后台  2 用户
    private int createId;   //   模板上传者ID
    private int status;  //    模板状态  0 待审核   -1 审核失败  1 审核通过 上架   2 下架
    private Date createTime;
    private Date publishTime;  // 模板发布时间
    private Date updateTime;
    private String comment; //审核评论

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCatalogID() {
        return catalogID;
    }

    public void setCatalogID(String catalogID) {
        this.catalogID = catalogID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    @Override
    public String getId() {
        return id;
    }

    @Override
    public void setId(String id) {
        this.id = id;
    }

    public int getSellCount() {
        return sellCount;
    }

    public void setSellCount(int sellCount) {
        this.sellCount = sellCount;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getNowPrice() {
        return nowPrice;
    }

    public void setNowPrice(String nowPrice) {
        this.nowPrice = nowPrice;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl == null ? null : fileUrl.trim();
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getIsTop() {
        return isTop;
    }

    public void setIsTop(String isTop) {
        this.isTop = isTop == null ? null : isTop.trim();
    }

    public String getIsRecommend() {
        return isRecommend;
    }

    public void setIsRecommend(String isRecommend) {
        this.isRecommend = isRecommend == null ? null : isRecommend.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public int getDownloadNum() {
        return downloadNum;
    }

    public void setDownloadNum(int downloadNum) {
        this.downloadNum = downloadNum;
    }

    public int getShareNum() {
        return shareNum;
    }

    public void setShareNum(int shareNum) {
        this.shareNum = shareNum;
    }

    public int getCollectNum() {
        return collectNum;
    }

    public void setCollectNum(int collectNum) {
        this.collectNum = collectNum;
    }

    public int getBrowseNum() {
        return browseNum;
    }

    public void setBrowseNum(int browseNum) {
        this.browseNum = browseNum;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public int getShowModel() {
        return showModel;
    }

    public void setShowModel(int showModel) {
        this.showModel = showModel;
    }

    public int getSource() {
        return source;
    }

    public void setSource(int source) {
        this.source = source;
    }

    public int getCreateId() {
        return createId;
    }

    public void setCreateId(int createId) {
        this.createId = createId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "Template{" +
                "id='" + id + '\'' +
                ", catalogID=" + catalogID +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", price='" + price + '\'' +
                ", nowPrice='" + nowPrice + '\'' +
                ", fileUrl='" + fileUrl + '\'' +
                ", score=" + score +
                ", isTop='" + isTop + '\'' +
                ", isRecommend='" + isRecommend + '\'' +
                ", description='" + description + '\'' +
                ", downloadNum=" + downloadNum +
                ", shareNum=" + shareNum +
                ", collectNum=" + collectNum +
                ", browseNum=" + browseNum +
                ", sellCount=" + sellCount +
                ", imgUrl='" + imgUrl + '\'' +
                ", showModel=" + showModel +
                ", source=" + source +
                ", createId=" + createId +
                ", videoUrl=" + videoUrl +
                ", status=" + status +
                ", createTime=" + createTime +
                ", publishTime=" + publishTime +
                ", updateTime=" + updateTime +
                '}';
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public String getShrinkUrl() {
        return shrinkUrl;
    }

    public void setShrinkUrl(String shrinkUrl) {
        this.shrinkUrl = shrinkUrl;
    }
}