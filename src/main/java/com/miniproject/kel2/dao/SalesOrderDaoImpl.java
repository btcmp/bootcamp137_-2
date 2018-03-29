package com.miniproject.kel2.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalesOrderDaoImpl implements SalesOrderDao{

	@Autowired
	SessionFactory sessionFactory;
}
