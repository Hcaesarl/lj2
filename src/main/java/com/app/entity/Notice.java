package com.app.entity;

/**
 * ��ע��Ʒ��֪ͨ��
 */
public class Notice {
    private String id;

    //��ע����
    private String title;

    //�û�id
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
