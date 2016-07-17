package com.zopsen.wordbook.dao;

import com.zopsen.wordbook.entity.WordBook;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Corbie on 2016/6/13.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml"})
public class WordBookDaoTest {

    @Resource
    private WordBookDao wordBookDao;

    @Test
    public void testGet() throws Exception {
       List<WordBook>list= wordBookDao.getlist("lm");
        for(WordBook wordBook:list){
            System.out.println(wordBook.getValue_());
        }
    }

    @Test
    public void testGetlist() throws Exception {

    }
}