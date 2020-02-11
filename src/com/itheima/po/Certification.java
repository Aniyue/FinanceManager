package com.itheima.po;

public class Certification {
    private  int cid;
    private  String  cemployee;
    private  String cname;
    private  String camount;
    private  String cdate;
    private  String cstatus;
    private  String ccomment;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCdate() {
        return cdate;
    }

    public void setCdate(String cdate) {
        this.cdate = cdate;
    }

    public String getCemployee() {
        return cemployee;
    }

    public void setCemployee(String cemployee) {
        this.cemployee = cemployee;
    }

    public String getCamount() {
        return camount;
    }

    public void setCamount(String camount) {
        this.camount = camount;
    }

    public String getCstatus() {
        return cstatus;
    }

    public void setCstatus(String cstatus) {
        this.cstatus = cstatus;
    }

    public String getCcomment() {
        return ccomment;
    }

    public void setCcomment(String ccomment) {
        this.ccomment = ccomment;
    }
}
