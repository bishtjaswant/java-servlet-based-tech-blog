package com.jaswant.techblog.entities;

public class Message {

    private String msg;
    private String type;
    private String cssClass;

    public Message() {}


    public Message(String msg, String type, String cssClass) {
        this.msg = msg;
        this.type = type;
        this.cssClass = cssClass;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }
}
