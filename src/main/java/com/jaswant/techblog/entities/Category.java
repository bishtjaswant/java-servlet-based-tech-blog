package com.jaswant.techblog.entities;

public class Category {
    private int cId;
    private String cName;
    private String cDescp;
    private String cCreated;

    public Category() {
    }

    public Category(String cName, String cDescp, String cCreated) {
        this.cName = cName;
        this.cDescp = cDescp;
        this.cCreated = cCreated;
    }

    public Category(int cId, String cName, String cDescp, String cCreated) {
        this.cId = cId;
        this.cName = cName;
        this.cDescp = cDescp;
        this.cCreated = cCreated;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcDescp() {
        return cDescp;
    }

    public void setcDescp(String cDescp) {
        this.cDescp = cDescp;
    }

    public String getcCreated() {
        return cCreated;
    }

    public void setcCreated(String cCreated) {
        this.cCreated = cCreated;
    }
}
