package com.jaswant.techblog.entities;

import java.sql.*;

public class Post {
    private int pId;
    private int pAuthorId;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String pImg;
    private int pCatId;
    private Timestamp pCreated;

    public Post() {
    }

    public Post(int pId, int pAuthorId, String pTitle, String pContent, String pCode, String pImg, int pCatId, Timestamp pCreated) {
        this.pId = pId;
        this.pAuthorId = pAuthorId;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pImg = pImg;
        this.pCatId = pCatId;
        this.pCreated = pCreated;
    }

    public Post(int pAuthorId, String pTitle, String pContent, String pCode, String pImg, int pCatId, Timestamp pCreated) {
        this.pAuthorId = pAuthorId;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pImg = pImg;
        this.pCatId = pCatId;
        this.pCreated = pCreated;
    }


    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public int getpAuthorId() {
        return pAuthorId;
    }

    public void setpAuthorId(int pAuthorId) {
        this.pAuthorId = pAuthorId;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpImg() {
        return pImg;
    }

    public void setpImg(String pImg) {
        this.pImg = pImg;
    }

    public int getpCatId() {
        return pCatId;
    }

    public void setpCatId(int pCatId) {
        this.pCatId = pCatId;
    }

    public Timestamp getpCreated() {
        return pCreated;
    }

    public void setpCreated(Timestamp pCreated) {
        this.pCreated = pCreated;
    }
}
