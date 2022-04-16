package com.blog.service;

import com.blog.entity.Comment;

import java.util.List;

/**
 * @Description: 博客评论业务层接口
 */
public interface CommentService {

    List<Comment> listCommentByBlogId(Long blogId);

    int saveComment(Comment comment);

//    查询子评论
//    List<Comment> getChildComment(Long blogId,Long id);

    //删除评论
    void deleteComment(Comment comment,Long id);

}