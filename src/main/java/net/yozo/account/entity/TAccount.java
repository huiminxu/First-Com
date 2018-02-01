package net.yozo.account.entity;

import java.io.Serializable;
import java.util.Date;

public class TAccount implements Serializable {
    private Integer id;

    private String account;

    private String nickname;

    private String password;

    private String city;

    private String address;

    private String postcode;

    private String cardtype;

    private String cardno;

    private Integer grade;

    private String amount;

    private String tel;

    private String email;

    private String emailisactive;

    private String freeze;

    private Date lastlogintime;

    private String lastloginip;

    private String lastloginarea;

    private String diffarealogin;

    private Date regeistdate;

    private Date freezestartdate;

    private Date freezeenddate;

    private String openid;

    private String weixinid;

    private String accesstoken;

    private String alipayuseid;

    private String sinaweiboid;

    private String sex;

    private String truename;

    private Date birthday;

    private String province;

    private String accounttype;

    private String rank;

    private Integer score;

    private Integer youdian;

    private String avater;

    private Date vipdate;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getCardtype() {
        return cardtype;
    }

    public void setCardtype(String cardtype) {
        this.cardtype = cardtype;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmailisactive() {
        return emailisactive;
    }

    public void setEmailisactive(String emailisactive) {
        this.emailisactive = emailisactive;
    }

    public String getFreeze() {
        return freeze;
    }

    public void setFreeze(String freeze) {
        this.freeze = freeze;
    }

    public Date getLastlogintime() {
        return lastlogintime;
    }

    public void setLastlogintime(Date lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    public String getLastloginip() {
        return lastloginip;
    }

    public void setLastloginip(String lastloginip) {
        this.lastloginip = lastloginip;
    }

    public String getLastloginarea() {
        return lastloginarea;
    }

    public void setLastloginarea(String lastloginarea) {
        this.lastloginarea = lastloginarea;
    }

    public String getDiffarealogin() {
        return diffarealogin;
    }

    public void setDiffarealogin(String diffarealogin) {
        this.diffarealogin = diffarealogin;
    }

    public Date getRegeistdate() {
        return regeistdate;
    }

    public void setRegeistdate(Date regeistdate) {
        this.regeistdate = regeistdate;
    }

    public Date getFreezestartdate() {
        return freezestartdate;
    }

    public void setFreezestartdate(Date freezestartdate) {
        this.freezestartdate = freezestartdate;
    }

    public Date getFreezeenddate() {
        return freezeenddate;
    }

    public void setFreezeenddate(Date freezeenddate) {
        this.freezeenddate = freezeenddate;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getWeixinid() {
        return weixinid;
    }

    public void setWeixinid(String weixinid) {
        this.weixinid = weixinid;
    }

    public String getAccesstoken() {
        return accesstoken;
    }

    public void setAccesstoken(String accesstoken) {
        this.accesstoken = accesstoken;
    }

    public String getAlipayuseid() {
        return alipayuseid;
    }

    public void setAlipayuseid(String alipayuseid) {
        this.alipayuseid = alipayuseid;
    }

    public String getSinaweiboid() {
        return sinaweiboid;
    }

    public void setSinaweiboid(String sinaweiboid) {
        this.sinaweiboid = sinaweiboid;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTruename() {
        return truename;
    }

    public void setTruename(String truename) {
        this.truename = truename;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getAccounttype() {
        return accounttype;
    }

    public void setAccounttype(String accounttype) {
        this.accounttype = accounttype;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getYoudian() {
        return youdian;
    }

    public void setYoudian(Integer youdian) {
        this.youdian = youdian;
    }

    public String getAvater() {
        return avater;
    }

    public void setAvater(String avater) {
        this.avater = avater;
    }

    public Date getVipdate() {
        return vipdate;
    }

    public void setVipdate(Date vipdate) {
        this.vipdate = vipdate;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        TAccount other = (TAccount) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getAccount() == null ? other.getAccount() == null : this.getAccount().equals(other.getAccount()))
            && (this.getNickname() == null ? other.getNickname() == null : this.getNickname().equals(other.getNickname()))
            && (this.getPassword() == null ? other.getPassword() == null : this.getPassword().equals(other.getPassword()))
            && (this.getCity() == null ? other.getCity() == null : this.getCity().equals(other.getCity()))
            && (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
            && (this.getPostcode() == null ? other.getPostcode() == null : this.getPostcode().equals(other.getPostcode()))
            && (this.getCardtype() == null ? other.getCardtype() == null : this.getCardtype().equals(other.getCardtype()))
            && (this.getCardno() == null ? other.getCardno() == null : this.getCardno().equals(other.getCardno()))
            && (this.getGrade() == null ? other.getGrade() == null : this.getGrade().equals(other.getGrade()))
            && (this.getAmount() == null ? other.getAmount() == null : this.getAmount().equals(other.getAmount()))
            && (this.getTel() == null ? other.getTel() == null : this.getTel().equals(other.getTel()))
            && (this.getEmail() == null ? other.getEmail() == null : this.getEmail().equals(other.getEmail()))
            && (this.getEmailisactive() == null ? other.getEmailisactive() == null : this.getEmailisactive().equals(other.getEmailisactive()))
            && (this.getFreeze() == null ? other.getFreeze() == null : this.getFreeze().equals(other.getFreeze()))
            && (this.getLastlogintime() == null ? other.getLastlogintime() == null : this.getLastlogintime().equals(other.getLastlogintime()))
            && (this.getLastloginip() == null ? other.getLastloginip() == null : this.getLastloginip().equals(other.getLastloginip()))
            && (this.getLastloginarea() == null ? other.getLastloginarea() == null : this.getLastloginarea().equals(other.getLastloginarea()))
            && (this.getDiffarealogin() == null ? other.getDiffarealogin() == null : this.getDiffarealogin().equals(other.getDiffarealogin()))
            && (this.getRegeistdate() == null ? other.getRegeistdate() == null : this.getRegeistdate().equals(other.getRegeistdate()))
            && (this.getFreezestartdate() == null ? other.getFreezestartdate() == null : this.getFreezestartdate().equals(other.getFreezestartdate()))
            && (this.getFreezeenddate() == null ? other.getFreezeenddate() == null : this.getFreezeenddate().equals(other.getFreezeenddate()))
            && (this.getOpenid() == null ? other.getOpenid() == null : this.getOpenid().equals(other.getOpenid()))
            && (this.getWeixinid() == null ? other.getWeixinid() == null : this.getWeixinid().equals(other.getWeixinid()))
            && (this.getAccesstoken() == null ? other.getAccesstoken() == null : this.getAccesstoken().equals(other.getAccesstoken()))
            && (this.getAlipayuseid() == null ? other.getAlipayuseid() == null : this.getAlipayuseid().equals(other.getAlipayuseid()))
            && (this.getSinaweiboid() == null ? other.getSinaweiboid() == null : this.getSinaweiboid().equals(other.getSinaweiboid()))
            && (this.getSex() == null ? other.getSex() == null : this.getSex().equals(other.getSex()))
            && (this.getTruename() == null ? other.getTruename() == null : this.getTruename().equals(other.getTruename()))
            && (this.getBirthday() == null ? other.getBirthday() == null : this.getBirthday().equals(other.getBirthday()))
            && (this.getProvince() == null ? other.getProvince() == null : this.getProvince().equals(other.getProvince()))
            && (this.getAccounttype() == null ? other.getAccounttype() == null : this.getAccounttype().equals(other.getAccounttype()))
            && (this.getRank() == null ? other.getRank() == null : this.getRank().equals(other.getRank()))
            && (this.getScore() == null ? other.getScore() == null : this.getScore().equals(other.getScore()))
            && (this.getYoudian() == null ? other.getYoudian() == null : this.getYoudian().equals(other.getYoudian()))
            && (this.getAvater() == null ? other.getAvater() == null : this.getAvater().equals(other.getAvater()))
            && (this.getVipdate() == null ? other.getVipdate() == null : this.getVipdate().equals(other.getVipdate()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getAccount() == null) ? 0 : getAccount().hashCode());
        result = prime * result + ((getNickname() == null) ? 0 : getNickname().hashCode());
        result = prime * result + ((getPassword() == null) ? 0 : getPassword().hashCode());
        result = prime * result + ((getCity() == null) ? 0 : getCity().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        result = prime * result + ((getPostcode() == null) ? 0 : getPostcode().hashCode());
        result = prime * result + ((getCardtype() == null) ? 0 : getCardtype().hashCode());
        result = prime * result + ((getCardno() == null) ? 0 : getCardno().hashCode());
        result = prime * result + ((getGrade() == null) ? 0 : getGrade().hashCode());
        result = prime * result + ((getAmount() == null) ? 0 : getAmount().hashCode());
        result = prime * result + ((getTel() == null) ? 0 : getTel().hashCode());
        result = prime * result + ((getEmail() == null) ? 0 : getEmail().hashCode());
        result = prime * result + ((getEmailisactive() == null) ? 0 : getEmailisactive().hashCode());
        result = prime * result + ((getFreeze() == null) ? 0 : getFreeze().hashCode());
        result = prime * result + ((getLastlogintime() == null) ? 0 : getLastlogintime().hashCode());
        result = prime * result + ((getLastloginip() == null) ? 0 : getLastloginip().hashCode());
        result = prime * result + ((getLastloginarea() == null) ? 0 : getLastloginarea().hashCode());
        result = prime * result + ((getDiffarealogin() == null) ? 0 : getDiffarealogin().hashCode());
        result = prime * result + ((getRegeistdate() == null) ? 0 : getRegeistdate().hashCode());
        result = prime * result + ((getFreezestartdate() == null) ? 0 : getFreezestartdate().hashCode());
        result = prime * result + ((getFreezeenddate() == null) ? 0 : getFreezeenddate().hashCode());
        result = prime * result + ((getOpenid() == null) ? 0 : getOpenid().hashCode());
        result = prime * result + ((getWeixinid() == null) ? 0 : getWeixinid().hashCode());
        result = prime * result + ((getAccesstoken() == null) ? 0 : getAccesstoken().hashCode());
        result = prime * result + ((getAlipayuseid() == null) ? 0 : getAlipayuseid().hashCode());
        result = prime * result + ((getSinaweiboid() == null) ? 0 : getSinaweiboid().hashCode());
        result = prime * result + ((getSex() == null) ? 0 : getSex().hashCode());
        result = prime * result + ((getTruename() == null) ? 0 : getTruename().hashCode());
        result = prime * result + ((getBirthday() == null) ? 0 : getBirthday().hashCode());
        result = prime * result + ((getProvince() == null) ? 0 : getProvince().hashCode());
        result = prime * result + ((getAccounttype() == null) ? 0 : getAccounttype().hashCode());
        result = prime * result + ((getRank() == null) ? 0 : getRank().hashCode());
        result = prime * result + ((getScore() == null) ? 0 : getScore().hashCode());
        result = prime * result + ((getYoudian() == null) ? 0 : getYoudian().hashCode());
        result = prime * result + ((getAvater() == null) ? 0 : getAvater().hashCode());
        result = prime * result + ((getVipdate() == null) ? 0 : getVipdate().hashCode());
        return result;
    }
}