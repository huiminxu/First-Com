package net.yozo.account.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class TAccountExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TAccountExample() {
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

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
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

        public Criteria andAccountIsNull() {
            addCriterion("account is null");
            return (Criteria) this;
        }

        public Criteria andAccountIsNotNull() {
            addCriterion("account is not null");
            return (Criteria) this;
        }

        public Criteria andAccountEqualTo(String value) {
            addCriterion("account =", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountNotEqualTo(String value) {
            addCriterion("account <>", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountGreaterThan(String value) {
            addCriterion("account >", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountGreaterThanOrEqualTo(String value) {
            addCriterion("account >=", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountLessThan(String value) {
            addCriterion("account <", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountLessThanOrEqualTo(String value) {
            addCriterion("account <=", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountLike(String value) {
            addCriterion("account like", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountNotLike(String value) {
            addCriterion("account not like", value, "account");
            return (Criteria) this;
        }

        public Criteria andAccountIn(List<String> values) {
            addCriterion("account in", values, "account");
            return (Criteria) this;
        }

        public Criteria andAccountNotIn(List<String> values) {
            addCriterion("account not in", values, "account");
            return (Criteria) this;
        }

        public Criteria andAccountBetween(String value1, String value2) {
            addCriterion("account between", value1, value2, "account");
            return (Criteria) this;
        }

        public Criteria andAccountNotBetween(String value1, String value2) {
            addCriterion("account not between", value1, value2, "account");
            return (Criteria) this;
        }

        public Criteria andNicknameIsNull() {
            addCriterion("nickname is null");
            return (Criteria) this;
        }

        public Criteria andNicknameIsNotNull() {
            addCriterion("nickname is not null");
            return (Criteria) this;
        }

        public Criteria andNicknameEqualTo(String value) {
            addCriterion("nickname =", value, "nickname");
            return (Criteria) this;
        }

        public Criteria andNicknameNotEqualTo(String value) {
            addCriterion("nickname <>", value, "nickname");
            return (Criteria) this;
        }

        public Criteria andNicknameGreaterThan(String value) {
            addCriterion("nickname >", value, "nickname");
            return (Criteria) this;
        }

        public Criteria andNicknameGreaterThanOrEqualTo(String value) {
            addCriterion("nickname >=", value, "nickname");
            return (Criteria) this;
        }

        public Criteria andNicknameLessThan(String value) {
            addCriterion("nickname <", value, "nickname");
            return (Criteria) this;
        }

        public Criteria andNicknameLessThanOrEqualTo(String value) {
            addCriterion("nickname <=", value, "nickname");
            return (Criteria) this;
        }

        public Criteria andNicknameLike(String value) {
            addCriterion("nickname like", value, "nickname");
            return (Criteria) this;
        }

        public Criteria andNicknameNotLike(String value) {
            addCriterion("nickname not like", value, "nickname");
            return (Criteria) this;
        }

        public Criteria andNicknameIn(List<String> values) {
            addCriterion("nickname in", values, "nickname");
            return (Criteria) this;
        }

        public Criteria andNicknameNotIn(List<String> values) {
            addCriterion("nickname not in", values, "nickname");
            return (Criteria) this;
        }

        public Criteria andNicknameBetween(String value1, String value2) {
            addCriterion("nickname between", value1, value2, "nickname");
            return (Criteria) this;
        }

        public Criteria andNicknameNotBetween(String value1, String value2) {
            addCriterion("nickname not between", value1, value2, "nickname");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNull() {
            addCriterion("password is null");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNotNull() {
            addCriterion("password is not null");
            return (Criteria) this;
        }

        public Criteria andPasswordEqualTo(String value) {
            addCriterion("password =", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotEqualTo(String value) {
            addCriterion("password <>", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThan(String value) {
            addCriterion("password >", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("password >=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThan(String value) {
            addCriterion("password <", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThanOrEqualTo(String value) {
            addCriterion("password <=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLike(String value) {
            addCriterion("password like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotLike(String value) {
            addCriterion("password not like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordIn(List<String> values) {
            addCriterion("password in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotIn(List<String> values) {
            addCriterion("password not in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordBetween(String value1, String value2) {
            addCriterion("password between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotBetween(String value1, String value2) {
            addCriterion("password not between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andCityIsNull() {
            addCriterion("city is null");
            return (Criteria) this;
        }

        public Criteria andCityIsNotNull() {
            addCriterion("city is not null");
            return (Criteria) this;
        }

        public Criteria andCityEqualTo(String value) {
            addCriterion("city =", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotEqualTo(String value) {
            addCriterion("city <>", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityGreaterThan(String value) {
            addCriterion("city >", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityGreaterThanOrEqualTo(String value) {
            addCriterion("city >=", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityLessThan(String value) {
            addCriterion("city <", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityLessThanOrEqualTo(String value) {
            addCriterion("city <=", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityLike(String value) {
            addCriterion("city like", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotLike(String value) {
            addCriterion("city not like", value, "city");
            return (Criteria) this;
        }

        public Criteria andCityIn(List<String> values) {
            addCriterion("city in", values, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotIn(List<String> values) {
            addCriterion("city not in", values, "city");
            return (Criteria) this;
        }

        public Criteria andCityBetween(String value1, String value2) {
            addCriterion("city between", value1, value2, "city");
            return (Criteria) this;
        }

        public Criteria andCityNotBetween(String value1, String value2) {
            addCriterion("city not between", value1, value2, "city");
            return (Criteria) this;
        }

        public Criteria andAddressIsNull() {
            addCriterion("address is null");
            return (Criteria) this;
        }

        public Criteria andAddressIsNotNull() {
            addCriterion("address is not null");
            return (Criteria) this;
        }

        public Criteria andAddressEqualTo(String value) {
            addCriterion("address =", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotEqualTo(String value) {
            addCriterion("address <>", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThan(String value) {
            addCriterion("address >", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThanOrEqualTo(String value) {
            addCriterion("address >=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThan(String value) {
            addCriterion("address <", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThanOrEqualTo(String value) {
            addCriterion("address <=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLike(String value) {
            addCriterion("address like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotLike(String value) {
            addCriterion("address not like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressIn(List<String> values) {
            addCriterion("address in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotIn(List<String> values) {
            addCriterion("address not in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressBetween(String value1, String value2) {
            addCriterion("address between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotBetween(String value1, String value2) {
            addCriterion("address not between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andPostcodeIsNull() {
            addCriterion("postcode is null");
            return (Criteria) this;
        }

        public Criteria andPostcodeIsNotNull() {
            addCriterion("postcode is not null");
            return (Criteria) this;
        }

        public Criteria andPostcodeEqualTo(String value) {
            addCriterion("postcode =", value, "postcode");
            return (Criteria) this;
        }

        public Criteria andPostcodeNotEqualTo(String value) {
            addCriterion("postcode <>", value, "postcode");
            return (Criteria) this;
        }

        public Criteria andPostcodeGreaterThan(String value) {
            addCriterion("postcode >", value, "postcode");
            return (Criteria) this;
        }

        public Criteria andPostcodeGreaterThanOrEqualTo(String value) {
            addCriterion("postcode >=", value, "postcode");
            return (Criteria) this;
        }

        public Criteria andPostcodeLessThan(String value) {
            addCriterion("postcode <", value, "postcode");
            return (Criteria) this;
        }

        public Criteria andPostcodeLessThanOrEqualTo(String value) {
            addCriterion("postcode <=", value, "postcode");
            return (Criteria) this;
        }

        public Criteria andPostcodeLike(String value) {
            addCriterion("postcode like", value, "postcode");
            return (Criteria) this;
        }

        public Criteria andPostcodeNotLike(String value) {
            addCriterion("postcode not like", value, "postcode");
            return (Criteria) this;
        }

        public Criteria andPostcodeIn(List<String> values) {
            addCriterion("postcode in", values, "postcode");
            return (Criteria) this;
        }

        public Criteria andPostcodeNotIn(List<String> values) {
            addCriterion("postcode not in", values, "postcode");
            return (Criteria) this;
        }

        public Criteria andPostcodeBetween(String value1, String value2) {
            addCriterion("postcode between", value1, value2, "postcode");
            return (Criteria) this;
        }

        public Criteria andPostcodeNotBetween(String value1, String value2) {
            addCriterion("postcode not between", value1, value2, "postcode");
            return (Criteria) this;
        }

        public Criteria andCardtypeIsNull() {
            addCriterion("cardType is null");
            return (Criteria) this;
        }

        public Criteria andCardtypeIsNotNull() {
            addCriterion("cardType is not null");
            return (Criteria) this;
        }

        public Criteria andCardtypeEqualTo(String value) {
            addCriterion("cardType =", value, "cardtype");
            return (Criteria) this;
        }

        public Criteria andCardtypeNotEqualTo(String value) {
            addCriterion("cardType <>", value, "cardtype");
            return (Criteria) this;
        }

        public Criteria andCardtypeGreaterThan(String value) {
            addCriterion("cardType >", value, "cardtype");
            return (Criteria) this;
        }

        public Criteria andCardtypeGreaterThanOrEqualTo(String value) {
            addCriterion("cardType >=", value, "cardtype");
            return (Criteria) this;
        }

        public Criteria andCardtypeLessThan(String value) {
            addCriterion("cardType <", value, "cardtype");
            return (Criteria) this;
        }

        public Criteria andCardtypeLessThanOrEqualTo(String value) {
            addCriterion("cardType <=", value, "cardtype");
            return (Criteria) this;
        }

        public Criteria andCardtypeLike(String value) {
            addCriterion("cardType like", value, "cardtype");
            return (Criteria) this;
        }

        public Criteria andCardtypeNotLike(String value) {
            addCriterion("cardType not like", value, "cardtype");
            return (Criteria) this;
        }

        public Criteria andCardtypeIn(List<String> values) {
            addCriterion("cardType in", values, "cardtype");
            return (Criteria) this;
        }

        public Criteria andCardtypeNotIn(List<String> values) {
            addCriterion("cardType not in", values, "cardtype");
            return (Criteria) this;
        }

        public Criteria andCardtypeBetween(String value1, String value2) {
            addCriterion("cardType between", value1, value2, "cardtype");
            return (Criteria) this;
        }

        public Criteria andCardtypeNotBetween(String value1, String value2) {
            addCriterion("cardType not between", value1, value2, "cardtype");
            return (Criteria) this;
        }

        public Criteria andCardnoIsNull() {
            addCriterion("cardNO is null");
            return (Criteria) this;
        }

        public Criteria andCardnoIsNotNull() {
            addCriterion("cardNO is not null");
            return (Criteria) this;
        }

        public Criteria andCardnoEqualTo(String value) {
            addCriterion("cardNO =", value, "cardno");
            return (Criteria) this;
        }

        public Criteria andCardnoNotEqualTo(String value) {
            addCriterion("cardNO <>", value, "cardno");
            return (Criteria) this;
        }

        public Criteria andCardnoGreaterThan(String value) {
            addCriterion("cardNO >", value, "cardno");
            return (Criteria) this;
        }

        public Criteria andCardnoGreaterThanOrEqualTo(String value) {
            addCriterion("cardNO >=", value, "cardno");
            return (Criteria) this;
        }

        public Criteria andCardnoLessThan(String value) {
            addCriterion("cardNO <", value, "cardno");
            return (Criteria) this;
        }

        public Criteria andCardnoLessThanOrEqualTo(String value) {
            addCriterion("cardNO <=", value, "cardno");
            return (Criteria) this;
        }

        public Criteria andCardnoLike(String value) {
            addCriterion("cardNO like", value, "cardno");
            return (Criteria) this;
        }

        public Criteria andCardnoNotLike(String value) {
            addCriterion("cardNO not like", value, "cardno");
            return (Criteria) this;
        }

        public Criteria andCardnoIn(List<String> values) {
            addCriterion("cardNO in", values, "cardno");
            return (Criteria) this;
        }

        public Criteria andCardnoNotIn(List<String> values) {
            addCriterion("cardNO not in", values, "cardno");
            return (Criteria) this;
        }

        public Criteria andCardnoBetween(String value1, String value2) {
            addCriterion("cardNO between", value1, value2, "cardno");
            return (Criteria) this;
        }

        public Criteria andCardnoNotBetween(String value1, String value2) {
            addCriterion("cardNO not between", value1, value2, "cardno");
            return (Criteria) this;
        }

        public Criteria andGradeIsNull() {
            addCriterion("grade is null");
            return (Criteria) this;
        }

        public Criteria andGradeIsNotNull() {
            addCriterion("grade is not null");
            return (Criteria) this;
        }

        public Criteria andGradeEqualTo(Integer value) {
            addCriterion("grade =", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeNotEqualTo(Integer value) {
            addCriterion("grade <>", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeGreaterThan(Integer value) {
            addCriterion("grade >", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeGreaterThanOrEqualTo(Integer value) {
            addCriterion("grade >=", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeLessThan(Integer value) {
            addCriterion("grade <", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeLessThanOrEqualTo(Integer value) {
            addCriterion("grade <=", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeIn(List<Integer> values) {
            addCriterion("grade in", values, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeNotIn(List<Integer> values) {
            addCriterion("grade not in", values, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeBetween(Integer value1, Integer value2) {
            addCriterion("grade between", value1, value2, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeNotBetween(Integer value1, Integer value2) {
            addCriterion("grade not between", value1, value2, "grade");
            return (Criteria) this;
        }

        public Criteria andAmountIsNull() {
            addCriterion("amount is null");
            return (Criteria) this;
        }

        public Criteria andAmountIsNotNull() {
            addCriterion("amount is not null");
            return (Criteria) this;
        }

        public Criteria andAmountEqualTo(String value) {
            addCriterion("amount =", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotEqualTo(String value) {
            addCriterion("amount <>", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountGreaterThan(String value) {
            addCriterion("amount >", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountGreaterThanOrEqualTo(String value) {
            addCriterion("amount >=", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLessThan(String value) {
            addCriterion("amount <", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLessThanOrEqualTo(String value) {
            addCriterion("amount <=", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLike(String value) {
            addCriterion("amount like", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotLike(String value) {
            addCriterion("amount not like", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountIn(List<String> values) {
            addCriterion("amount in", values, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotIn(List<String> values) {
            addCriterion("amount not in", values, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountBetween(String value1, String value2) {
            addCriterion("amount between", value1, value2, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotBetween(String value1, String value2) {
            addCriterion("amount not between", value1, value2, "amount");
            return (Criteria) this;
        }

        public Criteria andTelIsNull() {
            addCriterion("tel is null");
            return (Criteria) this;
        }

        public Criteria andTelIsNotNull() {
            addCriterion("tel is not null");
            return (Criteria) this;
        }

        public Criteria andTelEqualTo(String value) {
            addCriterion("tel =", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelNotEqualTo(String value) {
            addCriterion("tel <>", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelGreaterThan(String value) {
            addCriterion("tel >", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelGreaterThanOrEqualTo(String value) {
            addCriterion("tel >=", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelLessThan(String value) {
            addCriterion("tel <", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelLessThanOrEqualTo(String value) {
            addCriterion("tel <=", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelLike(String value) {
            addCriterion("tel like", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelNotLike(String value) {
            addCriterion("tel not like", value, "tel");
            return (Criteria) this;
        }

        public Criteria andTelIn(List<String> values) {
            addCriterion("tel in", values, "tel");
            return (Criteria) this;
        }

        public Criteria andTelNotIn(List<String> values) {
            addCriterion("tel not in", values, "tel");
            return (Criteria) this;
        }

        public Criteria andTelBetween(String value1, String value2) {
            addCriterion("tel between", value1, value2, "tel");
            return (Criteria) this;
        }

        public Criteria andTelNotBetween(String value1, String value2) {
            addCriterion("tel not between", value1, value2, "tel");
            return (Criteria) this;
        }

        public Criteria andEmailIsNull() {
            addCriterion("email is null");
            return (Criteria) this;
        }

        public Criteria andEmailIsNotNull() {
            addCriterion("email is not null");
            return (Criteria) this;
        }

        public Criteria andEmailEqualTo(String value) {
            addCriterion("email =", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotEqualTo(String value) {
            addCriterion("email <>", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThan(String value) {
            addCriterion("email >", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThanOrEqualTo(String value) {
            addCriterion("email >=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThan(String value) {
            addCriterion("email <", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThanOrEqualTo(String value) {
            addCriterion("email <=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLike(String value) {
            addCriterion("email like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotLike(String value) {
            addCriterion("email not like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailIn(List<String> values) {
            addCriterion("email in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotIn(List<String> values) {
            addCriterion("email not in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailBetween(String value1, String value2) {
            addCriterion("email between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotBetween(String value1, String value2) {
            addCriterion("email not between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveIsNull() {
            addCriterion("emailIsActive is null");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveIsNotNull() {
            addCriterion("emailIsActive is not null");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveEqualTo(String value) {
            addCriterion("emailIsActive =", value, "emailisactive");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveNotEqualTo(String value) {
            addCriterion("emailIsActive <>", value, "emailisactive");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveGreaterThan(String value) {
            addCriterion("emailIsActive >", value, "emailisactive");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveGreaterThanOrEqualTo(String value) {
            addCriterion("emailIsActive >=", value, "emailisactive");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveLessThan(String value) {
            addCriterion("emailIsActive <", value, "emailisactive");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveLessThanOrEqualTo(String value) {
            addCriterion("emailIsActive <=", value, "emailisactive");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveLike(String value) {
            addCriterion("emailIsActive like", value, "emailisactive");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveNotLike(String value) {
            addCriterion("emailIsActive not like", value, "emailisactive");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveIn(List<String> values) {
            addCriterion("emailIsActive in", values, "emailisactive");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveNotIn(List<String> values) {
            addCriterion("emailIsActive not in", values, "emailisactive");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveBetween(String value1, String value2) {
            addCriterion("emailIsActive between", value1, value2, "emailisactive");
            return (Criteria) this;
        }

        public Criteria andEmailisactiveNotBetween(String value1, String value2) {
            addCriterion("emailIsActive not between", value1, value2, "emailisactive");
            return (Criteria) this;
        }

        public Criteria andFreezeIsNull() {
            addCriterion("freeze is null");
            return (Criteria) this;
        }

        public Criteria andFreezeIsNotNull() {
            addCriterion("freeze is not null");
            return (Criteria) this;
        }

        public Criteria andFreezeEqualTo(String value) {
            addCriterion("freeze =", value, "freeze");
            return (Criteria) this;
        }

        public Criteria andFreezeNotEqualTo(String value) {
            addCriterion("freeze <>", value, "freeze");
            return (Criteria) this;
        }

        public Criteria andFreezeGreaterThan(String value) {
            addCriterion("freeze >", value, "freeze");
            return (Criteria) this;
        }

        public Criteria andFreezeGreaterThanOrEqualTo(String value) {
            addCriterion("freeze >=", value, "freeze");
            return (Criteria) this;
        }

        public Criteria andFreezeLessThan(String value) {
            addCriterion("freeze <", value, "freeze");
            return (Criteria) this;
        }

        public Criteria andFreezeLessThanOrEqualTo(String value) {
            addCriterion("freeze <=", value, "freeze");
            return (Criteria) this;
        }

        public Criteria andFreezeLike(String value) {
            addCriterion("freeze like", value, "freeze");
            return (Criteria) this;
        }

        public Criteria andFreezeNotLike(String value) {
            addCriterion("freeze not like", value, "freeze");
            return (Criteria) this;
        }

        public Criteria andFreezeIn(List<String> values) {
            addCriterion("freeze in", values, "freeze");
            return (Criteria) this;
        }

        public Criteria andFreezeNotIn(List<String> values) {
            addCriterion("freeze not in", values, "freeze");
            return (Criteria) this;
        }

        public Criteria andFreezeBetween(String value1, String value2) {
            addCriterion("freeze between", value1, value2, "freeze");
            return (Criteria) this;
        }

        public Criteria andFreezeNotBetween(String value1, String value2) {
            addCriterion("freeze not between", value1, value2, "freeze");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeIsNull() {
            addCriterion("lastLoginTime is null");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeIsNotNull() {
            addCriterion("lastLoginTime is not null");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeEqualTo(Date value) {
            addCriterion("lastLoginTime =", value, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeNotEqualTo(Date value) {
            addCriterion("lastLoginTime <>", value, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeGreaterThan(Date value) {
            addCriterion("lastLoginTime >", value, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeGreaterThanOrEqualTo(Date value) {
            addCriterion("lastLoginTime >=", value, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeLessThan(Date value) {
            addCriterion("lastLoginTime <", value, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeLessThanOrEqualTo(Date value) {
            addCriterion("lastLoginTime <=", value, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeIn(List<Date> values) {
            addCriterion("lastLoginTime in", values, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeNotIn(List<Date> values) {
            addCriterion("lastLoginTime not in", values, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeBetween(Date value1, Date value2) {
            addCriterion("lastLoginTime between", value1, value2, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastlogintimeNotBetween(Date value1, Date value2) {
            addCriterion("lastLoginTime not between", value1, value2, "lastlogintime");
            return (Criteria) this;
        }

        public Criteria andLastloginipIsNull() {
            addCriterion("lastLoginIp is null");
            return (Criteria) this;
        }

        public Criteria andLastloginipIsNotNull() {
            addCriterion("lastLoginIp is not null");
            return (Criteria) this;
        }

        public Criteria andLastloginipEqualTo(String value) {
            addCriterion("lastLoginIp =", value, "lastloginip");
            return (Criteria) this;
        }

        public Criteria andLastloginipNotEqualTo(String value) {
            addCriterion("lastLoginIp <>", value, "lastloginip");
            return (Criteria) this;
        }

        public Criteria andLastloginipGreaterThan(String value) {
            addCriterion("lastLoginIp >", value, "lastloginip");
            return (Criteria) this;
        }

        public Criteria andLastloginipGreaterThanOrEqualTo(String value) {
            addCriterion("lastLoginIp >=", value, "lastloginip");
            return (Criteria) this;
        }

        public Criteria andLastloginipLessThan(String value) {
            addCriterion("lastLoginIp <", value, "lastloginip");
            return (Criteria) this;
        }

        public Criteria andLastloginipLessThanOrEqualTo(String value) {
            addCriterion("lastLoginIp <=", value, "lastloginip");
            return (Criteria) this;
        }

        public Criteria andLastloginipLike(String value) {
            addCriterion("lastLoginIp like", value, "lastloginip");
            return (Criteria) this;
        }

        public Criteria andLastloginipNotLike(String value) {
            addCriterion("lastLoginIp not like", value, "lastloginip");
            return (Criteria) this;
        }

        public Criteria andLastloginipIn(List<String> values) {
            addCriterion("lastLoginIp in", values, "lastloginip");
            return (Criteria) this;
        }

        public Criteria andLastloginipNotIn(List<String> values) {
            addCriterion("lastLoginIp not in", values, "lastloginip");
            return (Criteria) this;
        }

        public Criteria andLastloginipBetween(String value1, String value2) {
            addCriterion("lastLoginIp between", value1, value2, "lastloginip");
            return (Criteria) this;
        }

        public Criteria andLastloginipNotBetween(String value1, String value2) {
            addCriterion("lastLoginIp not between", value1, value2, "lastloginip");
            return (Criteria) this;
        }

        public Criteria andLastloginareaIsNull() {
            addCriterion("lastLoginArea is null");
            return (Criteria) this;
        }

        public Criteria andLastloginareaIsNotNull() {
            addCriterion("lastLoginArea is not null");
            return (Criteria) this;
        }

        public Criteria andLastloginareaEqualTo(String value) {
            addCriterion("lastLoginArea =", value, "lastloginarea");
            return (Criteria) this;
        }

        public Criteria andLastloginareaNotEqualTo(String value) {
            addCriterion("lastLoginArea <>", value, "lastloginarea");
            return (Criteria) this;
        }

        public Criteria andLastloginareaGreaterThan(String value) {
            addCriterion("lastLoginArea >", value, "lastloginarea");
            return (Criteria) this;
        }

        public Criteria andLastloginareaGreaterThanOrEqualTo(String value) {
            addCriterion("lastLoginArea >=", value, "lastloginarea");
            return (Criteria) this;
        }

        public Criteria andLastloginareaLessThan(String value) {
            addCriterion("lastLoginArea <", value, "lastloginarea");
            return (Criteria) this;
        }

        public Criteria andLastloginareaLessThanOrEqualTo(String value) {
            addCriterion("lastLoginArea <=", value, "lastloginarea");
            return (Criteria) this;
        }

        public Criteria andLastloginareaLike(String value) {
            addCriterion("lastLoginArea like", value, "lastloginarea");
            return (Criteria) this;
        }

        public Criteria andLastloginareaNotLike(String value) {
            addCriterion("lastLoginArea not like", value, "lastloginarea");
            return (Criteria) this;
        }

        public Criteria andLastloginareaIn(List<String> values) {
            addCriterion("lastLoginArea in", values, "lastloginarea");
            return (Criteria) this;
        }

        public Criteria andLastloginareaNotIn(List<String> values) {
            addCriterion("lastLoginArea not in", values, "lastloginarea");
            return (Criteria) this;
        }

        public Criteria andLastloginareaBetween(String value1, String value2) {
            addCriterion("lastLoginArea between", value1, value2, "lastloginarea");
            return (Criteria) this;
        }

        public Criteria andLastloginareaNotBetween(String value1, String value2) {
            addCriterion("lastLoginArea not between", value1, value2, "lastloginarea");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginIsNull() {
            addCriterion("diffAreaLogin is null");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginIsNotNull() {
            addCriterion("diffAreaLogin is not null");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginEqualTo(String value) {
            addCriterion("diffAreaLogin =", value, "diffarealogin");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginNotEqualTo(String value) {
            addCriterion("diffAreaLogin <>", value, "diffarealogin");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginGreaterThan(String value) {
            addCriterion("diffAreaLogin >", value, "diffarealogin");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginGreaterThanOrEqualTo(String value) {
            addCriterion("diffAreaLogin >=", value, "diffarealogin");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginLessThan(String value) {
            addCriterion("diffAreaLogin <", value, "diffarealogin");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginLessThanOrEqualTo(String value) {
            addCriterion("diffAreaLogin <=", value, "diffarealogin");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginLike(String value) {
            addCriterion("diffAreaLogin like", value, "diffarealogin");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginNotLike(String value) {
            addCriterion("diffAreaLogin not like", value, "diffarealogin");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginIn(List<String> values) {
            addCriterion("diffAreaLogin in", values, "diffarealogin");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginNotIn(List<String> values) {
            addCriterion("diffAreaLogin not in", values, "diffarealogin");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginBetween(String value1, String value2) {
            addCriterion("diffAreaLogin between", value1, value2, "diffarealogin");
            return (Criteria) this;
        }

        public Criteria andDiffarealoginNotBetween(String value1, String value2) {
            addCriterion("diffAreaLogin not between", value1, value2, "diffarealogin");
            return (Criteria) this;
        }

        public Criteria andRegeistdateIsNull() {
            addCriterion("regeistDate is null");
            return (Criteria) this;
        }

        public Criteria andRegeistdateIsNotNull() {
            addCriterion("regeistDate is not null");
            return (Criteria) this;
        }

        public Criteria andRegeistdateEqualTo(Date value) {
            addCriterion("regeistDate =", value, "regeistdate");
            return (Criteria) this;
        }

        public Criteria andRegeistdateNotEqualTo(Date value) {
            addCriterion("regeistDate <>", value, "regeistdate");
            return (Criteria) this;
        }

        public Criteria andRegeistdateGreaterThan(Date value) {
            addCriterion("regeistDate >", value, "regeistdate");
            return (Criteria) this;
        }

        public Criteria andRegeistdateGreaterThanOrEqualTo(Date value) {
            addCriterion("regeistDate >=", value, "regeistdate");
            return (Criteria) this;
        }

        public Criteria andRegeistdateLessThan(Date value) {
            addCriterion("regeistDate <", value, "regeistdate");
            return (Criteria) this;
        }

        public Criteria andRegeistdateLessThanOrEqualTo(Date value) {
            addCriterion("regeistDate <=", value, "regeistdate");
            return (Criteria) this;
        }

        public Criteria andRegeistdateIn(List<Date> values) {
            addCriterion("regeistDate in", values, "regeistdate");
            return (Criteria) this;
        }

        public Criteria andRegeistdateNotIn(List<Date> values) {
            addCriterion("regeistDate not in", values, "regeistdate");
            return (Criteria) this;
        }

        public Criteria andRegeistdateBetween(Date value1, Date value2) {
            addCriterion("regeistDate between", value1, value2, "regeistdate");
            return (Criteria) this;
        }

        public Criteria andRegeistdateNotBetween(Date value1, Date value2) {
            addCriterion("regeistDate not between", value1, value2, "regeistdate");
            return (Criteria) this;
        }

        public Criteria andFreezestartdateIsNull() {
            addCriterion("freezeStartdate is null");
            return (Criteria) this;
        }

        public Criteria andFreezestartdateIsNotNull() {
            addCriterion("freezeStartdate is not null");
            return (Criteria) this;
        }

        public Criteria andFreezestartdateEqualTo(Date value) {
            addCriterionForJDBCDate("freezeStartdate =", value, "freezestartdate");
            return (Criteria) this;
        }

        public Criteria andFreezestartdateNotEqualTo(Date value) {
            addCriterionForJDBCDate("freezeStartdate <>", value, "freezestartdate");
            return (Criteria) this;
        }

        public Criteria andFreezestartdateGreaterThan(Date value) {
            addCriterionForJDBCDate("freezeStartdate >", value, "freezestartdate");
            return (Criteria) this;
        }

        public Criteria andFreezestartdateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("freezeStartdate >=", value, "freezestartdate");
            return (Criteria) this;
        }

        public Criteria andFreezestartdateLessThan(Date value) {
            addCriterionForJDBCDate("freezeStartdate <", value, "freezestartdate");
            return (Criteria) this;
        }

        public Criteria andFreezestartdateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("freezeStartdate <=", value, "freezestartdate");
            return (Criteria) this;
        }

        public Criteria andFreezestartdateIn(List<Date> values) {
            addCriterionForJDBCDate("freezeStartdate in", values, "freezestartdate");
            return (Criteria) this;
        }

        public Criteria andFreezestartdateNotIn(List<Date> values) {
            addCriterionForJDBCDate("freezeStartdate not in", values, "freezestartdate");
            return (Criteria) this;
        }

        public Criteria andFreezestartdateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("freezeStartdate between", value1, value2, "freezestartdate");
            return (Criteria) this;
        }

        public Criteria andFreezestartdateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("freezeStartdate not between", value1, value2, "freezestartdate");
            return (Criteria) this;
        }

        public Criteria andFreezeenddateIsNull() {
            addCriterion("freezeEnddate is null");
            return (Criteria) this;
        }

        public Criteria andFreezeenddateIsNotNull() {
            addCriterion("freezeEnddate is not null");
            return (Criteria) this;
        }

        public Criteria andFreezeenddateEqualTo(Date value) {
            addCriterionForJDBCDate("freezeEnddate =", value, "freezeenddate");
            return (Criteria) this;
        }

        public Criteria andFreezeenddateNotEqualTo(Date value) {
            addCriterionForJDBCDate("freezeEnddate <>", value, "freezeenddate");
            return (Criteria) this;
        }

        public Criteria andFreezeenddateGreaterThan(Date value) {
            addCriterionForJDBCDate("freezeEnddate >", value, "freezeenddate");
            return (Criteria) this;
        }

        public Criteria andFreezeenddateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("freezeEnddate >=", value, "freezeenddate");
            return (Criteria) this;
        }

        public Criteria andFreezeenddateLessThan(Date value) {
            addCriterionForJDBCDate("freezeEnddate <", value, "freezeenddate");
            return (Criteria) this;
        }

        public Criteria andFreezeenddateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("freezeEnddate <=", value, "freezeenddate");
            return (Criteria) this;
        }

        public Criteria andFreezeenddateIn(List<Date> values) {
            addCriterionForJDBCDate("freezeEnddate in", values, "freezeenddate");
            return (Criteria) this;
        }

        public Criteria andFreezeenddateNotIn(List<Date> values) {
            addCriterionForJDBCDate("freezeEnddate not in", values, "freezeenddate");
            return (Criteria) this;
        }

        public Criteria andFreezeenddateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("freezeEnddate between", value1, value2, "freezeenddate");
            return (Criteria) this;
        }

        public Criteria andFreezeenddateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("freezeEnddate not between", value1, value2, "freezeenddate");
            return (Criteria) this;
        }

        public Criteria andOpenidIsNull() {
            addCriterion("openId is null");
            return (Criteria) this;
        }

        public Criteria andOpenidIsNotNull() {
            addCriterion("openId is not null");
            return (Criteria) this;
        }

        public Criteria andOpenidEqualTo(String value) {
            addCriterion("openId =", value, "openid");
            return (Criteria) this;
        }

        public Criteria andOpenidNotEqualTo(String value) {
            addCriterion("openId <>", value, "openid");
            return (Criteria) this;
        }

        public Criteria andOpenidGreaterThan(String value) {
            addCriterion("openId >", value, "openid");
            return (Criteria) this;
        }

        public Criteria andOpenidGreaterThanOrEqualTo(String value) {
            addCriterion("openId >=", value, "openid");
            return (Criteria) this;
        }

        public Criteria andOpenidLessThan(String value) {
            addCriterion("openId <", value, "openid");
            return (Criteria) this;
        }

        public Criteria andOpenidLessThanOrEqualTo(String value) {
            addCriterion("openId <=", value, "openid");
            return (Criteria) this;
        }

        public Criteria andOpenidLike(String value) {
            addCriterion("openId like", value, "openid");
            return (Criteria) this;
        }

        public Criteria andOpenidNotLike(String value) {
            addCriterion("openId not like", value, "openid");
            return (Criteria) this;
        }

        public Criteria andOpenidIn(List<String> values) {
            addCriterion("openId in", values, "openid");
            return (Criteria) this;
        }

        public Criteria andOpenidNotIn(List<String> values) {
            addCriterion("openId not in", values, "openid");
            return (Criteria) this;
        }

        public Criteria andOpenidBetween(String value1, String value2) {
            addCriterion("openId between", value1, value2, "openid");
            return (Criteria) this;
        }

        public Criteria andOpenidNotBetween(String value1, String value2) {
            addCriterion("openId not between", value1, value2, "openid");
            return (Criteria) this;
        }

        public Criteria andWeixinidIsNull() {
            addCriterion("weixinID is null");
            return (Criteria) this;
        }

        public Criteria andWeixinidIsNotNull() {
            addCriterion("weixinID is not null");
            return (Criteria) this;
        }

        public Criteria andWeixinidEqualTo(String value) {
            addCriterion("weixinID =", value, "weixinid");
            return (Criteria) this;
        }

        public Criteria andWeixinidNotEqualTo(String value) {
            addCriterion("weixinID <>", value, "weixinid");
            return (Criteria) this;
        }

        public Criteria andWeixinidGreaterThan(String value) {
            addCriterion("weixinID >", value, "weixinid");
            return (Criteria) this;
        }

        public Criteria andWeixinidGreaterThanOrEqualTo(String value) {
            addCriterion("weixinID >=", value, "weixinid");
            return (Criteria) this;
        }

        public Criteria andWeixinidLessThan(String value) {
            addCriterion("weixinID <", value, "weixinid");
            return (Criteria) this;
        }

        public Criteria andWeixinidLessThanOrEqualTo(String value) {
            addCriterion("weixinID <=", value, "weixinid");
            return (Criteria) this;
        }

        public Criteria andWeixinidLike(String value) {
            addCriterion("weixinID like", value, "weixinid");
            return (Criteria) this;
        }

        public Criteria andWeixinidNotLike(String value) {
            addCriterion("weixinID not like", value, "weixinid");
            return (Criteria) this;
        }

        public Criteria andWeixinidIn(List<String> values) {
            addCriterion("weixinID in", values, "weixinid");
            return (Criteria) this;
        }

        public Criteria andWeixinidNotIn(List<String> values) {
            addCriterion("weixinID not in", values, "weixinid");
            return (Criteria) this;
        }

        public Criteria andWeixinidBetween(String value1, String value2) {
            addCriterion("weixinID between", value1, value2, "weixinid");
            return (Criteria) this;
        }

        public Criteria andWeixinidNotBetween(String value1, String value2) {
            addCriterion("weixinID not between", value1, value2, "weixinid");
            return (Criteria) this;
        }

        public Criteria andAccesstokenIsNull() {
            addCriterion("accessToken is null");
            return (Criteria) this;
        }

        public Criteria andAccesstokenIsNotNull() {
            addCriterion("accessToken is not null");
            return (Criteria) this;
        }

        public Criteria andAccesstokenEqualTo(String value) {
            addCriterion("accessToken =", value, "accesstoken");
            return (Criteria) this;
        }

        public Criteria andAccesstokenNotEqualTo(String value) {
            addCriterion("accessToken <>", value, "accesstoken");
            return (Criteria) this;
        }

        public Criteria andAccesstokenGreaterThan(String value) {
            addCriterion("accessToken >", value, "accesstoken");
            return (Criteria) this;
        }

        public Criteria andAccesstokenGreaterThanOrEqualTo(String value) {
            addCriterion("accessToken >=", value, "accesstoken");
            return (Criteria) this;
        }

        public Criteria andAccesstokenLessThan(String value) {
            addCriterion("accessToken <", value, "accesstoken");
            return (Criteria) this;
        }

        public Criteria andAccesstokenLessThanOrEqualTo(String value) {
            addCriterion("accessToken <=", value, "accesstoken");
            return (Criteria) this;
        }

        public Criteria andAccesstokenLike(String value) {
            addCriterion("accessToken like", value, "accesstoken");
            return (Criteria) this;
        }

        public Criteria andAccesstokenNotLike(String value) {
            addCriterion("accessToken not like", value, "accesstoken");
            return (Criteria) this;
        }

        public Criteria andAccesstokenIn(List<String> values) {
            addCriterion("accessToken in", values, "accesstoken");
            return (Criteria) this;
        }

        public Criteria andAccesstokenNotIn(List<String> values) {
            addCriterion("accessToken not in", values, "accesstoken");
            return (Criteria) this;
        }

        public Criteria andAccesstokenBetween(String value1, String value2) {
            addCriterion("accessToken between", value1, value2, "accesstoken");
            return (Criteria) this;
        }

        public Criteria andAccesstokenNotBetween(String value1, String value2) {
            addCriterion("accessToken not between", value1, value2, "accesstoken");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidIsNull() {
            addCriterion("alipayUseId is null");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidIsNotNull() {
            addCriterion("alipayUseId is not null");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidEqualTo(String value) {
            addCriterion("alipayUseId =", value, "alipayuseid");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidNotEqualTo(String value) {
            addCriterion("alipayUseId <>", value, "alipayuseid");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidGreaterThan(String value) {
            addCriterion("alipayUseId >", value, "alipayuseid");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidGreaterThanOrEqualTo(String value) {
            addCriterion("alipayUseId >=", value, "alipayuseid");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidLessThan(String value) {
            addCriterion("alipayUseId <", value, "alipayuseid");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidLessThanOrEqualTo(String value) {
            addCriterion("alipayUseId <=", value, "alipayuseid");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidLike(String value) {
            addCriterion("alipayUseId like", value, "alipayuseid");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidNotLike(String value) {
            addCriterion("alipayUseId not like", value, "alipayuseid");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidIn(List<String> values) {
            addCriterion("alipayUseId in", values, "alipayuseid");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidNotIn(List<String> values) {
            addCriterion("alipayUseId not in", values, "alipayuseid");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidBetween(String value1, String value2) {
            addCriterion("alipayUseId between", value1, value2, "alipayuseid");
            return (Criteria) this;
        }

        public Criteria andAlipayuseidNotBetween(String value1, String value2) {
            addCriterion("alipayUseId not between", value1, value2, "alipayuseid");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidIsNull() {
            addCriterion("sinaWeiboID is null");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidIsNotNull() {
            addCriterion("sinaWeiboID is not null");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidEqualTo(String value) {
            addCriterion("sinaWeiboID =", value, "sinaweiboid");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidNotEqualTo(String value) {
            addCriterion("sinaWeiboID <>", value, "sinaweiboid");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidGreaterThan(String value) {
            addCriterion("sinaWeiboID >", value, "sinaweiboid");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidGreaterThanOrEqualTo(String value) {
            addCriterion("sinaWeiboID >=", value, "sinaweiboid");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidLessThan(String value) {
            addCriterion("sinaWeiboID <", value, "sinaweiboid");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidLessThanOrEqualTo(String value) {
            addCriterion("sinaWeiboID <=", value, "sinaweiboid");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidLike(String value) {
            addCriterion("sinaWeiboID like", value, "sinaweiboid");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidNotLike(String value) {
            addCriterion("sinaWeiboID not like", value, "sinaweiboid");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidIn(List<String> values) {
            addCriterion("sinaWeiboID in", values, "sinaweiboid");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidNotIn(List<String> values) {
            addCriterion("sinaWeiboID not in", values, "sinaweiboid");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidBetween(String value1, String value2) {
            addCriterion("sinaWeiboID between", value1, value2, "sinaweiboid");
            return (Criteria) this;
        }

        public Criteria andSinaweiboidNotBetween(String value1, String value2) {
            addCriterion("sinaWeiboID not between", value1, value2, "sinaweiboid");
            return (Criteria) this;
        }

        public Criteria andSexIsNull() {
            addCriterion("sex is null");
            return (Criteria) this;
        }

        public Criteria andSexIsNotNull() {
            addCriterion("sex is not null");
            return (Criteria) this;
        }

        public Criteria andSexEqualTo(String value) {
            addCriterion("sex =", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexNotEqualTo(String value) {
            addCriterion("sex <>", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexGreaterThan(String value) {
            addCriterion("sex >", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexGreaterThanOrEqualTo(String value) {
            addCriterion("sex >=", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexLessThan(String value) {
            addCriterion("sex <", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexLessThanOrEqualTo(String value) {
            addCriterion("sex <=", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexLike(String value) {
            addCriterion("sex like", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexNotLike(String value) {
            addCriterion("sex not like", value, "sex");
            return (Criteria) this;
        }

        public Criteria andSexIn(List<String> values) {
            addCriterion("sex in", values, "sex");
            return (Criteria) this;
        }

        public Criteria andSexNotIn(List<String> values) {
            addCriterion("sex not in", values, "sex");
            return (Criteria) this;
        }

        public Criteria andSexBetween(String value1, String value2) {
            addCriterion("sex between", value1, value2, "sex");
            return (Criteria) this;
        }

        public Criteria andSexNotBetween(String value1, String value2) {
            addCriterion("sex not between", value1, value2, "sex");
            return (Criteria) this;
        }

        public Criteria andTruenameIsNull() {
            addCriterion("trueName is null");
            return (Criteria) this;
        }

        public Criteria andTruenameIsNotNull() {
            addCriterion("trueName is not null");
            return (Criteria) this;
        }

        public Criteria andTruenameEqualTo(String value) {
            addCriterion("trueName =", value, "truename");
            return (Criteria) this;
        }

        public Criteria andTruenameNotEqualTo(String value) {
            addCriterion("trueName <>", value, "truename");
            return (Criteria) this;
        }

        public Criteria andTruenameGreaterThan(String value) {
            addCriterion("trueName >", value, "truename");
            return (Criteria) this;
        }

        public Criteria andTruenameGreaterThanOrEqualTo(String value) {
            addCriterion("trueName >=", value, "truename");
            return (Criteria) this;
        }

        public Criteria andTruenameLessThan(String value) {
            addCriterion("trueName <", value, "truename");
            return (Criteria) this;
        }

        public Criteria andTruenameLessThanOrEqualTo(String value) {
            addCriterion("trueName <=", value, "truename");
            return (Criteria) this;
        }

        public Criteria andTruenameLike(String value) {
            addCriterion("trueName like", value, "truename");
            return (Criteria) this;
        }

        public Criteria andTruenameNotLike(String value) {
            addCriterion("trueName not like", value, "truename");
            return (Criteria) this;
        }

        public Criteria andTruenameIn(List<String> values) {
            addCriterion("trueName in", values, "truename");
            return (Criteria) this;
        }

        public Criteria andTruenameNotIn(List<String> values) {
            addCriterion("trueName not in", values, "truename");
            return (Criteria) this;
        }

        public Criteria andTruenameBetween(String value1, String value2) {
            addCriterion("trueName between", value1, value2, "truename");
            return (Criteria) this;
        }

        public Criteria andTruenameNotBetween(String value1, String value2) {
            addCriterion("trueName not between", value1, value2, "truename");
            return (Criteria) this;
        }

        public Criteria andBirthdayIsNull() {
            addCriterion("birthday is null");
            return (Criteria) this;
        }

        public Criteria andBirthdayIsNotNull() {
            addCriterion("birthday is not null");
            return (Criteria) this;
        }

        public Criteria andBirthdayEqualTo(Date value) {
            addCriterionForJDBCDate("birthday =", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayNotEqualTo(Date value) {
            addCriterionForJDBCDate("birthday <>", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayGreaterThan(Date value) {
            addCriterionForJDBCDate("birthday >", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("birthday >=", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayLessThan(Date value) {
            addCriterionForJDBCDate("birthday <", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("birthday <=", value, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayIn(List<Date> values) {
            addCriterionForJDBCDate("birthday in", values, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayNotIn(List<Date> values) {
            addCriterionForJDBCDate("birthday not in", values, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("birthday between", value1, value2, "birthday");
            return (Criteria) this;
        }

        public Criteria andBirthdayNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("birthday not between", value1, value2, "birthday");
            return (Criteria) this;
        }

        public Criteria andProvinceIsNull() {
            addCriterion("province is null");
            return (Criteria) this;
        }

        public Criteria andProvinceIsNotNull() {
            addCriterion("province is not null");
            return (Criteria) this;
        }

        public Criteria andProvinceEqualTo(String value) {
            addCriterion("province =", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceNotEqualTo(String value) {
            addCriterion("province <>", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceGreaterThan(String value) {
            addCriterion("province >", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceGreaterThanOrEqualTo(String value) {
            addCriterion("province >=", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceLessThan(String value) {
            addCriterion("province <", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceLessThanOrEqualTo(String value) {
            addCriterion("province <=", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceLike(String value) {
            addCriterion("province like", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceNotLike(String value) {
            addCriterion("province not like", value, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceIn(List<String> values) {
            addCriterion("province in", values, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceNotIn(List<String> values) {
            addCriterion("province not in", values, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceBetween(String value1, String value2) {
            addCriterion("province between", value1, value2, "province");
            return (Criteria) this;
        }

        public Criteria andProvinceNotBetween(String value1, String value2) {
            addCriterion("province not between", value1, value2, "province");
            return (Criteria) this;
        }

        public Criteria andAccounttypeIsNull() {
            addCriterion("accountType is null");
            return (Criteria) this;
        }

        public Criteria andAccounttypeIsNotNull() {
            addCriterion("accountType is not null");
            return (Criteria) this;
        }

        public Criteria andAccounttypeEqualTo(String value) {
            addCriterion("accountType =", value, "accounttype");
            return (Criteria) this;
        }

        public Criteria andAccounttypeNotEqualTo(String value) {
            addCriterion("accountType <>", value, "accounttype");
            return (Criteria) this;
        }

        public Criteria andAccounttypeGreaterThan(String value) {
            addCriterion("accountType >", value, "accounttype");
            return (Criteria) this;
        }

        public Criteria andAccounttypeGreaterThanOrEqualTo(String value) {
            addCriterion("accountType >=", value, "accounttype");
            return (Criteria) this;
        }

        public Criteria andAccounttypeLessThan(String value) {
            addCriterion("accountType <", value, "accounttype");
            return (Criteria) this;
        }

        public Criteria andAccounttypeLessThanOrEqualTo(String value) {
            addCriterion("accountType <=", value, "accounttype");
            return (Criteria) this;
        }

        public Criteria andAccounttypeLike(String value) {
            addCriterion("accountType like", value, "accounttype");
            return (Criteria) this;
        }

        public Criteria andAccounttypeNotLike(String value) {
            addCriterion("accountType not like", value, "accounttype");
            return (Criteria) this;
        }

        public Criteria andAccounttypeIn(List<String> values) {
            addCriterion("accountType in", values, "accounttype");
            return (Criteria) this;
        }

        public Criteria andAccounttypeNotIn(List<String> values) {
            addCriterion("accountType not in", values, "accounttype");
            return (Criteria) this;
        }

        public Criteria andAccounttypeBetween(String value1, String value2) {
            addCriterion("accountType between", value1, value2, "accounttype");
            return (Criteria) this;
        }

        public Criteria andAccounttypeNotBetween(String value1, String value2) {
            addCriterion("accountType not between", value1, value2, "accounttype");
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

        public Criteria andYoudianIsNull() {
            addCriterion("youdian is null");
            return (Criteria) this;
        }

        public Criteria andYoudianIsNotNull() {
            addCriterion("youdian is not null");
            return (Criteria) this;
        }

        public Criteria andYoudianEqualTo(Integer value) {
            addCriterion("youdian =", value, "youdian");
            return (Criteria) this;
        }

        public Criteria andYoudianNotEqualTo(Integer value) {
            addCriterion("youdian <>", value, "youdian");
            return (Criteria) this;
        }

        public Criteria andYoudianGreaterThan(Integer value) {
            addCriterion("youdian >", value, "youdian");
            return (Criteria) this;
        }

        public Criteria andYoudianGreaterThanOrEqualTo(Integer value) {
            addCriterion("youdian >=", value, "youdian");
            return (Criteria) this;
        }

        public Criteria andYoudianLessThan(Integer value) {
            addCriterion("youdian <", value, "youdian");
            return (Criteria) this;
        }

        public Criteria andYoudianLessThanOrEqualTo(Integer value) {
            addCriterion("youdian <=", value, "youdian");
            return (Criteria) this;
        }

        public Criteria andYoudianIn(List<Integer> values) {
            addCriterion("youdian in", values, "youdian");
            return (Criteria) this;
        }

        public Criteria andYoudianNotIn(List<Integer> values) {
            addCriterion("youdian not in", values, "youdian");
            return (Criteria) this;
        }

        public Criteria andYoudianBetween(Integer value1, Integer value2) {
            addCriterion("youdian between", value1, value2, "youdian");
            return (Criteria) this;
        }

        public Criteria andYoudianNotBetween(Integer value1, Integer value2) {
            addCriterion("youdian not between", value1, value2, "youdian");
            return (Criteria) this;
        }

        public Criteria andAvaterIsNull() {
            addCriterion("avater is null");
            return (Criteria) this;
        }

        public Criteria andAvaterIsNotNull() {
            addCriterion("avater is not null");
            return (Criteria) this;
        }

        public Criteria andAvaterEqualTo(String value) {
            addCriterion("avater =", value, "avater");
            return (Criteria) this;
        }

        public Criteria andAvaterNotEqualTo(String value) {
            addCriterion("avater <>", value, "avater");
            return (Criteria) this;
        }

        public Criteria andAvaterGreaterThan(String value) {
            addCriterion("avater >", value, "avater");
            return (Criteria) this;
        }

        public Criteria andAvaterGreaterThanOrEqualTo(String value) {
            addCriterion("avater >=", value, "avater");
            return (Criteria) this;
        }

        public Criteria andAvaterLessThan(String value) {
            addCriterion("avater <", value, "avater");
            return (Criteria) this;
        }

        public Criteria andAvaterLessThanOrEqualTo(String value) {
            addCriterion("avater <=", value, "avater");
            return (Criteria) this;
        }

        public Criteria andAvaterLike(String value) {
            addCriterion("avater like", value, "avater");
            return (Criteria) this;
        }

        public Criteria andAvaterNotLike(String value) {
            addCriterion("avater not like", value, "avater");
            return (Criteria) this;
        }

        public Criteria andAvaterIn(List<String> values) {
            addCriterion("avater in", values, "avater");
            return (Criteria) this;
        }

        public Criteria andAvaterNotIn(List<String> values) {
            addCriterion("avater not in", values, "avater");
            return (Criteria) this;
        }

        public Criteria andAvaterBetween(String value1, String value2) {
            addCriterion("avater between", value1, value2, "avater");
            return (Criteria) this;
        }

        public Criteria andAvaterNotBetween(String value1, String value2) {
            addCriterion("avater not between", value1, value2, "avater");
            return (Criteria) this;
        }

        public Criteria andVipdateIsNull() {
            addCriterion("vipDate is null");
            return (Criteria) this;
        }

        public Criteria andVipdateIsNotNull() {
            addCriterion("vipDate is not null");
            return (Criteria) this;
        }

        public Criteria andVipdateEqualTo(Date value) {
            addCriterion("vipDate =", value, "vipdate");
            return (Criteria) this;
        }

        public Criteria andVipdateNotEqualTo(Date value) {
            addCriterion("vipDate <>", value, "vipdate");
            return (Criteria) this;
        }

        public Criteria andVipdateGreaterThan(Date value) {
            addCriterion("vipDate >", value, "vipdate");
            return (Criteria) this;
        }

        public Criteria andVipdateGreaterThanOrEqualTo(Date value) {
            addCriterion("vipDate >=", value, "vipdate");
            return (Criteria) this;
        }

        public Criteria andVipdateLessThan(Date value) {
            addCriterion("vipDate <", value, "vipdate");
            return (Criteria) this;
        }

        public Criteria andVipdateLessThanOrEqualTo(Date value) {
            addCriterion("vipDate <=", value, "vipdate");
            return (Criteria) this;
        }

        public Criteria andVipdateIn(List<Date> values) {
            addCriterion("vipDate in", values, "vipdate");
            return (Criteria) this;
        }

        public Criteria andVipdateNotIn(List<Date> values) {
            addCriterion("vipDate not in", values, "vipdate");
            return (Criteria) this;
        }

        public Criteria andVipdateBetween(Date value1, Date value2) {
            addCriterion("vipDate between", value1, value2, "vipdate");
            return (Criteria) this;
        }

        public Criteria andVipdateNotBetween(Date value1, Date value2) {
            addCriterion("vipDate not between", value1, value2, "vipdate");
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