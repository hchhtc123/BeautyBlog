package com.blog.service;

import com.blog.entity.Message;

import java.util.List;

/**
 * @Description: 留言业务层接口
 */
public interface MessageService {

    //查询留言列表
    List<Message> listMessage();

    //保存留言
    int saveMessage(Message message);

    //删除留言
    void deleteMessage(Long id);

}