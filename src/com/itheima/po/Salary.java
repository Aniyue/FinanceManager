package com.itheima.po;

public class Salary {
    private int sid;//员工编号
    private String sname;//员工姓名
    private String sdepart;//部门
    private String sjob;//职位
    private String sjiben;//基本工资
    private String sjiaoshui;//缴税
    private String sjiaban;//加班费
    private String sbonus;//奖金
    private String sfine;//罚金
    private String stotal;//总计

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSbonus() {
        return sbonus;
    }

    public void setSbonus(String sbonus) {
        this.sbonus = sbonus;
    }

    public String getSdepart() {
        return sdepart;
    }

    public void setSdepart(String sdepart) {
        this.sdepart = sdepart;
    }

    public String getSfine() {
        return sfine;
    }

    public void setSfine(String sfine) {
        this.sfine = sfine;
    }

    public String getSjiaban() {
        return sjiaban;
    }

    public void setSjiaban(String sjiaban) {
        this.sjiaban = sjiaban;
    }

    public String getSjiaoshui() {
        return sjiaoshui;
    }

    public void setSjiaoshui(String sjiaoshui) {
        this.sjiaoshui = sjiaoshui;
    }

    public String getSjiben() {
        return sjiben;
    }

    public void setSjiben(String sjiben) {
        this.sjiben = sjiben;
    }

    public String getSjob() {
        return sjob;
    }

    public void setSjob(String sjob) {
        this.sjob = sjob;
    }

    public String getStotal() {
        return stotal;
    }

    public void setStotal(String stotal) {
        this.stotal = stotal;
    }
}