package com.blog.service.Impl;

import com.blog.dao.FriendLinkDao;
import com.blog.entity.FriendLink;
import com.blog.service.FriendLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description: 友链业务层接口实现类
 */
@Service
public class FriendLinkServiceImpl implements FriendLinkService {

    @Autowired
    private FriendLinkDao friendLinkDao;

    @Override
    public List<FriendLink> listFriendLink() {
        return friendLinkDao.listFriendLink();
    }

    @Override
    public int saveFriendLink(FriendLink friendLink) {
        return friendLinkDao.saveFriendLink(friendLink);
    }

    @Override
    public FriendLink getFriendLink(Long id) {
        return friendLinkDao.getFriendLink(id);
    }

    @Override
    public FriendLink getFriendLinkByBlogaddress(String blogaddress) {
        return friendLinkDao.getFriendLinkByBlogaddress(blogaddress);
    }

    @Override
    public int updateFriendLink(FriendLink friendLink) {
        return friendLinkDao.updateFriendLink(friendLink);
    }

    @Override
    public void deleteFriendLink(Long id) {
        friendLinkDao.deleteFriendLink(id);
    }


}