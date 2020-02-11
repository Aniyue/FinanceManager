package com.itheima.po;

public class Budget {
    private int bid;
    private String bname;
    private String bproject;
    private String bdepart;
    private String bcost;
    private String bbenefit;
    private String bdate;
    private String bcomment;

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getBdepart() {
        return bdepart;
    }

    public void setBdepart(String bdepart) {
        this.bdepart = bdepart;
    }

    public String getBproject() {
        return bproject;
    }

    public void setBproject(String bproject) {
        this.bproject = bproject;
    }

    public String getBdate() {
        return bdate;
    }

    public void setBdate(String bdate) {
        this.bdate = bdate;
    }

    public String getBcomment() {
        return bcomment;
    }

    public void setBcomment(String bcomment) {
        this.bcomment = bcomment;
    }

    public String getBbenefit() {
        return bbenefit;
    }

    public void setBbenefit(String bbenefit) {
        this.bbenefit = bbenefit;
    }

    public String getBcost() {
        return bcost;
    }

    public void setBcost(String bcost) {
        this.bcost = bcost;
    }
}
