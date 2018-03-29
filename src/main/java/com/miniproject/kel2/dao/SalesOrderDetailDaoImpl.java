package com.miniproject.kel2.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalesOrderDetailDaoImpl implements SalesOrderDetailDao{

	@Autowired
	SessionFactory sessionFactory;
}
