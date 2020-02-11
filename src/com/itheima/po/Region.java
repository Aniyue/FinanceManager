package com.itheima.po;

public class Region {

    private int r_regionkey;

    private String r_name;

    private String r_comment;

    private String ps_supplycost;

    private String ps_comment;

    public int getR_regionkey() {
        return r_regionkey;
    }

    public void setR_regionkey(int r_regionkey) {
        this.r_regionkey = r_regionkey;
    }

    public String getR_name() {
        return r_name;
    }

    public void setR_name(String r_name) {
        this.r_name = r_name;
    }

    public String getR_comment() {
        return r_comment;
    }

    public void setR_comment(String r_comment) {
        this.r_comment = r_comment;
    }

    public String getPs_supplycost() {
        return ps_supplycost;
    }

    public void setPs_supplycost(String ps_supplycost) {
        this.ps_supplycost = ps_supplycost;
    }

    public String getPs_comment() {
        return ps_comment;
    }

    public void setPs_comment(String ps_comment) {
        this.ps_comment = ps_comment;
    }


//    @Override
//    public String toString() {
//        return "Region [r_regionkey=" + r_regionkey + ", r_name=" + r_name + ", r_comment=" + r_comment + ", ps_supplycost=" + ps_supplycost + ", ps_comment=" + ps_comment + "]";
//    }



}