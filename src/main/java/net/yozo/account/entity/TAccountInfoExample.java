package net.yozo.account.entity;

import java.util.ArrayList;
import java.util.List;

public class TAccountInfoExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TAccountInfoExample() {
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

        public Criteria andAccountIdIsNull() {
            addCriterion("account_id is null");
            return (Criteria) this;
        }

        public Criteria andAccountIdIsNotNull() {
            addCriterion("account_id is not null");
            return (Criteria) this;
        }

        public Criteria andAccountIdEqualTo(Integer value) {
            addCriterion("account_id =", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdNotEqualTo(Integer value) {
            addCriterion("account_id <>", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdGreaterThan(Integer value) {
            addCriterion("account_id >", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("account_id >=", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdLessThan(Integer value) {
            addCriterion("account_id <", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdLessThanOrEqualTo(Integer value) {
            addCriterion("account_id <=", value, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdIn(List<Integer> values) {
            addCriterion("account_id in", values, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdNotIn(List<Integer> values) {
            addCriterion("account_id not in", values, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdBetween(Integer value1, Integer value2) {
            addCriterion("account_id between", value1, value2, "accountId");
            return (Criteria) this;
        }

        public Criteria andAccountIdNotBetween(Integer value1, Integer value2) {
            addCriterion("account_id not between", value1, value2, "accountId");
            return (Criteria) this;
        }

        public Criteria andGrowthValueIsNull() {
            addCriterion("growth_value is null");
            return (Criteria) this;
        }

        public Criteria andGrowthValueIsNotNull() {
            addCriterion("growth_value is not null");
            return (Criteria) this;
        }

        public Criteria andGrowthValueEqualTo(Integer value) {
            addCriterion("growth_value =", value, "growthValue");
            return (Criteria) this;
        }

        public Criteria andGrowthValueNotEqualTo(Integer value) {
            addCriterion("growth_value <>", value, "growthValue");
            return (Criteria) this;
        }

        public Criteria andGrowthValueGreaterThan(Integer value) {
            addCriterion("growth_value >", value, "growthValue");
            return (Criteria) this;
        }

        public Criteria andGrowthValueGreaterThanOrEqualTo(Integer value) {
            addCriterion("growth_value >=", value, "growthValue");
            return (Criteria) this;
        }

        public Criteria andGrowthValueLessThan(Integer value) {
            addCriterion("growth_value <", value, "growthValue");
            return (Criteria) this;
        }

        public Criteria andGrowthValueLessThanOrEqualTo(Integer value) {
            addCriterion("growth_value <=", value, "growthValue");
            return (Criteria) this;
        }

        public Criteria andGrowthValueIn(List<Integer> values) {
            addCriterion("growth_value in", values, "growthValue");
            return (Criteria) this;
        }

        public Criteria andGrowthValueNotIn(List<Integer> values) {
            addCriterion("growth_value not in", values, "growthValue");
            return (Criteria) this;
        }

        public Criteria andGrowthValueBetween(Integer value1, Integer value2) {
            addCriterion("growth_value between", value1, value2, "growthValue");
            return (Criteria) this;
        }

        public Criteria andGrowthValueNotBetween(Integer value1, Integer value2) {
            addCriterion("growth_value not between", value1, value2, "growthValue");
            return (Criteria) this;
        }

        public Criteria andScoreIsNull() {
            addCriterion("score is null");
            return (Criteria) this;
        }

        public Criteria andScoreIsNotNull() {
            addCriterion("score is not null");
            return (Criteria) this;
        }

        public Criteria andScoreEqualTo(Integer value) {
            addCriterion("score =", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotEqualTo(Integer value) {
            addCriterion("score <>", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreGreaterThan(Integer value) {
            addCriterion("score >", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("score >=", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreLessThan(Integer value) {
            addCriterion("score <", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreLessThanOrEqualTo(Integer value) {
            addCriterion("score <=", value, "score");
            return (Criteria) this;
        }

        public Criteria andScoreIn(List<Integer> values) {
            addCriterion("score in", values, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotIn(List<Integer> values) {
            addCriterion("score not in", values, "score");
            return (Criteria) this;
        }

        public Criteria andScoreBetween(Integer value1, Integer value2) {
            addCriterion("score between", value1, value2, "score");
            return (Criteria) this;
        }

        public Criteria andScoreNotBetween(Integer value1, Integer value2) {
            addCriterion("score not between", value1, value2, "score");
            return (Criteria) this;
        }

        public Criteria andAvaterChangeIsNull() {
            addCriterion("avater_change is null");
            return (Criteria) this;
        }

        public Criteria andAvaterChangeIsNotNull() {
            addCriterion("avater_change is not null");
            return (Criteria) this;
        }

        public Criteria andAvaterChangeEqualTo(Integer value) {
            addCriterion("avater_change =", value, "avaterChange");
            return (Criteria) this;
        }

        public Criteria andAvaterChangeNotEqualTo(Integer value) {
            addCriterion("avater_change <>", value, "avaterChange");
            return (Criteria) this;
        }

        public Criteria andAvaterChangeGreaterThan(Integer value) {
            addCriterion("avater_change >", value, "avaterChange");
            return (Criteria) this;
        }

        public Criteria andAvaterChangeGreaterThanOrEqualTo(Integer value) {
            addCriterion("avater_change >=", value, "avaterChange");
            return (Criteria) this;
        }

        public Criteria andAvaterChangeLessThan(Integer value) {
            addCriterion("avater_change <", value, "avaterChange");
            return (Criteria) this;
        }

        public Criteria andAvaterChangeLessThanOrEqualTo(Integer value) {
            addCriterion("avater_change <=", value, "avaterChange");
            return (Criteria) this;
        }

        public Criteria andAvaterChangeIn(List<Integer> values) {
            addCriterion("avater_change in", values, "avaterChange");
            return (Criteria) this;
        }

        public Criteria andAvaterChangeNotIn(List<Integer> values) {
            addCriterion("avater_change not in", values, "avaterChange");
            return (Criteria) this;
        }

        public Criteria andAvaterChangeBetween(Integer value1, Integer value2) {
            addCriterion("avater_change between", value1, value2, "avaterChange");
            return (Criteria) this;
        }

        public Criteria andAvaterChangeNotBetween(Integer value1, Integer value2) {
            addCriterion("avater_change not between", value1, value2, "avaterChange");
            return (Criteria) this;
        }

        public Criteria andNicknameChangeIsNull() {
            addCriterion("nickname_change is null");
            return (Criteria) this;
        }

        public Criteria andNicknameChangeIsNotNull() {
            addCriterion("nickname_change is not null");
            return (Criteria) this;
        }

        public Criteria andNicknameChangeEqualTo(Integer value) {
            addCriterion("nickname_change =", value, "nicknameChange");
            return (Criteria) this;
        }

        public Criteria andNicknameChangeNotEqualTo(Integer value) {
            addCriterion("nickname_change <>", value, "nicknameChange");
            return (Criteria) this;
        }

        public Criteria andNicknameChangeGreaterThan(Integer value) {
            addCriterion("nickname_change >", value, "nicknameChange");
            return (Criteria) this;
        }

        public Criteria andNicknameChangeGreaterThanOrEqualTo(Integer value) {
            addCriterion("nickname_change >=", value, "nicknameChange");
            return (Criteria) this;
        }

        public Criteria andNicknameChangeLessThan(Integer value) {
            addCriterion("nickname_change <", value, "nicknameChange");
            return (Criteria) this;
        }

        public Criteria andNicknameChangeLessThanOrEqualTo(Integer value) {
            addCriterion("nickname_change <=", value, "nicknameChange");
            return (Criteria) this;
        }

        public Criteria andNicknameChangeIn(List<Integer> values) {
            addCriterion("nickname_change in", values, "nicknameChange");
            return (Criteria) this;
        }

        public Criteria andNicknameChangeNotIn(List<Integer> values) {
            addCriterion("nickname_change not in", values, "nicknameChange");
            return (Criteria) this;
        }

        public Criteria andNicknameChangeBetween(Integer value1, Integer value2) {
            addCriterion("nickname_change between", value1, value2, "nicknameChange");
            return (Criteria) this;
        }

        public Criteria andNicknameChangeNotBetween(Integer value1, Integer value2) {
            addCriterion("nickname_change not between", value1, value2, "nicknameChange");
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