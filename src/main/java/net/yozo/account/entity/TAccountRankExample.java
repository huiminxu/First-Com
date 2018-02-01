package net.yozo.account.entity;

import java.util.ArrayList;
import java.util.List;

public class TAccountRankExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TAccountRankExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andRankIsNull() {
            addCriterion("rank is null");
            return (Criteria) this;
        }

        public Criteria andRankIsNotNull() {
            addCriterion("rank is not null");
            return (Criteria) this;
        }

        public Criteria andRankEqualTo(String value) {
            addCriterion("rank =", value, "rank");
            return (Criteria) this;
        }

        public Criteria andRankNotEqualTo(String value) {
            addCriterion("rank <>", value, "rank");
            return (Criteria) this;
        }

        public Criteria andRankGreaterThan(String value) {
            addCriterion("rank >", value, "rank");
            return (Criteria) this;
        }

        public Criteria andRankGreaterThanOrEqualTo(String value) {
            addCriterion("rank >=", value, "rank");
            return (Criteria) this;
        }

        public Criteria andRankLessThan(String value) {
            addCriterion("rank <", value, "rank");
            return (Criteria) this;
        }

        public Criteria andRankLessThanOrEqualTo(String value) {
            addCriterion("rank <=", value, "rank");
            return (Criteria) this;
        }

        public Criteria andRankLike(String value) {
            addCriterion("rank like", value, "rank");
            return (Criteria) this;
        }

        public Criteria andRankNotLike(String value) {
            addCriterion("rank not like", value, "rank");
            return (Criteria) this;
        }

        public Criteria andRankIn(List<String> values) {
            addCriterion("rank in", values, "rank");
            return (Criteria) this;
        }

        public Criteria andRankNotIn(List<String> values) {
            addCriterion("rank not in", values, "rank");
            return (Criteria) this;
        }

        public Criteria andRankBetween(String value1, String value2) {
            addCriterion("rank between", value1, value2, "rank");
            return (Criteria) this;
        }

        public Criteria andRankNotBetween(String value1, String value2) {
            addCriterion("rank not between", value1, value2, "rank");
            return (Criteria) this;
        }

        public Criteria andMinvaluesIsNull() {
            addCriterion("minvalues is null");
            return (Criteria) this;
        }

        public Criteria andMinvaluesIsNotNull() {
            addCriterion("minvalues is not null");
            return (Criteria) this;
        }

        public Criteria andMinvaluesEqualTo(Integer value) {
            addCriterion("minvalues =", value, "minvalues");
            return (Criteria) this;
        }

        public Criteria andMinvaluesNotEqualTo(Integer value) {
            addCriterion("minvalues <>", value, "minvalues");
            return (Criteria) this;
        }

        public Criteria andMinvaluesGreaterThan(Integer value) {
            addCriterion("minvalues >", value, "minvalues");
            return (Criteria) this;
        }

        public Criteria andMinvaluesGreaterThanOrEqualTo(Integer value) {
            addCriterion("minvalues >=", value, "minvalues");
            return (Criteria) this;
        }

        public Criteria andMinvaluesLessThan(Integer value) {
            addCriterion("minvalues <", value, "minvalues");
            return (Criteria) this;
        }

        public Criteria andMinvaluesLessThanOrEqualTo(Integer value) {
            addCriterion("minvalues <=", value, "minvalues");
            return (Criteria) this;
        }

        public Criteria andMinvaluesIn(List<Integer> values) {
            addCriterion("minvalues in", values, "minvalues");
            return (Criteria) this;
        }

        public Criteria andMinvaluesNotIn(List<Integer> values) {
            addCriterion("minvalues not in", values, "minvalues");
            return (Criteria) this;
        }

        public Criteria andMinvaluesBetween(Integer value1, Integer value2) {
            addCriterion("minvalues between", value1, value2, "minvalues");
            return (Criteria) this;
        }

        public Criteria andMinvaluesNotBetween(Integer value1, Integer value2) {
            addCriterion("minvalues not between", value1, value2, "minvalues");
            return (Criteria) this;
        }

        public Criteria andMaxvaluesIsNull() {
            addCriterion("maxvalues is null");
            return (Criteria) this;
        }

        public Criteria andMaxvaluesIsNotNull() {
            addCriterion("maxvalues is not null");
            return (Criteria) this;
        }

        public Criteria andMaxvaluesEqualTo(Integer value) {
            addCriterion("maxvalues =", value, "maxvalues");
            return (Criteria) this;
        }

        public Criteria andMaxvaluesNotEqualTo(Integer value) {
            addCriterion("maxvalues <>", value, "maxvalues");
            return (Criteria) this;
        }

        public Criteria andMaxvaluesGreaterThan(Integer value) {
            addCriterion("maxvalues >", value, "maxvalues");
            return (Criteria) this;
        }

        public Criteria andMaxvaluesGreaterThanOrEqualTo(Integer value) {
            addCriterion("maxvalues >=", value, "maxvalues");
            return (Criteria) this;
        }

        public Criteria andMaxvaluesLessThan(Integer value) {
            addCriterion("maxvalues <", value, "maxvalues");
            return (Criteria) this;
        }

        public Criteria andMaxvaluesLessThanOrEqualTo(Integer value) {
            addCriterion("maxvalues <=", value, "maxvalues");
            return (Criteria) this;
        }

        public Criteria andMaxvaluesIn(List<Integer> values) {
            addCriterion("maxvalues in", values, "maxvalues");
            return (Criteria) this;
        }

        public Criteria andMaxvaluesNotIn(List<Integer> values) {
            addCriterion("maxvalues not in", values, "maxvalues");
            return (Criteria) this;
        }

        public Criteria andMaxvaluesBetween(Integer value1, Integer value2) {
            addCriterion("maxvalues between", value1, value2, "maxvalues");
            return (Criteria) this;
        }

        public Criteria andMaxvaluesNotBetween(Integer value1, Integer value2) {
            addCriterion("maxvalues not between", value1, value2, "maxvalues");
            return (Criteria) this;
        }

        public Criteria andRankImgIsNull() {
            addCriterion("rank_img is null");
            return (Criteria) this;
        }

        public Criteria andRankImgIsNotNull() {
            addCriterion("rank_img is not null");
            return (Criteria) this;
        }

        public Criteria andRankImgEqualTo(String value) {
            addCriterion("rank_img =", value, "rankImg");
            return (Criteria) this;
        }

        public Criteria andRankImgNotEqualTo(String value) {
            addCriterion("rank_img <>", value, "rankImg");
            return (Criteria) this;
        }

        public Criteria andRankImgGreaterThan(String value) {
            addCriterion("rank_img >", value, "rankImg");
            return (Criteria) this;
        }

        public Criteria andRankImgGreaterThanOrEqualTo(String value) {
            addCriterion("rank_img >=", value, "rankImg");
            return (Criteria) this;
        }

        public Criteria andRankImgLessThan(String value) {
            addCriterion("rank_img <", value, "rankImg");
            return (Criteria) this;
        }

        public Criteria andRankImgLessThanOrEqualTo(String value) {
            addCriterion("rank_img <=", value, "rankImg");
            return (Criteria) this;
        }

        public Criteria andRankImgLike(String value) {
            addCriterion("rank_img like", value, "rankImg");
            return (Criteria) this;
        }

        public Criteria andRankImgNotLike(String value) {
            addCriterion("rank_img not like", value, "rankImg");
            return (Criteria) this;
        }

        public Criteria andRankImgIn(List<String> values) {
            addCriterion("rank_img in", values, "rankImg");
            return (Criteria) this;
        }

        public Criteria andRankImgNotIn(List<String> values) {
            addCriterion("rank_img not in", values, "rankImg");
            return (Criteria) this;
        }

        public Criteria andRankImgBetween(String value1, String value2) {
            addCriterion("rank_img between", value1, value2, "rankImg");
            return (Criteria) this;
        }

        public Criteria andRankImgNotBetween(String value1, String value2) {
            addCriterion("rank_img not between", value1, value2, "rankImg");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}