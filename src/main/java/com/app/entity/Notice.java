package com.app.entity;

/**
 * 关注商品，通知类
 */
public class Notice {
    private String id;

    //关注标题
    private String title;

    //用户id
    private String UserId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUserId() {
        return UserId;
    }

    public void setUserId(String userId) {
        UserId = userId;
    }
}
