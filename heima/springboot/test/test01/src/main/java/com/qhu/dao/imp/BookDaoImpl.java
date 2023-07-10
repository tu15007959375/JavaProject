package com.qhu.dao.imp;

import com.qhu.dao.BookDao;
import org.springframework.stereotype.Repository;

@Repository
public class BookDaoImpl implements BookDao {
    @Override
    public void save() {
        System.out.println("book save finish........");
    }
}
