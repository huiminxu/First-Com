package net.yozo.services.front.template.dto;

/**
 * 推荐模板查询DTO
 * Created by t on 2018/1/5.
 */
public class RelatedTemplateQuery {
    private Integer tempalteId; //模板ID
    private int start;  //limit start

    public Integer getTempalteId() {
        return tempalteId;
    }

    public void setTempalteId(Integer tempalteId) {
        this.tempalteId = tempalteId;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

}
