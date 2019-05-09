package com.app.service;

import com.app.entity.Notice;

import java.util.List;

public interface NoticeService {
    public void save(String title, String userId);

    public List<Notice> searchByUser(String userId);

    public void delete(String name, String userId);
}
