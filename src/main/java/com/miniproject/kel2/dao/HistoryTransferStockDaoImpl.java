package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.HistoryTransferStock;

@Repository
public class HistoryTransferStockDaoImpl implements HistoryTransferStockDao{

	@Autowired
	SessionFactory sessionFactory;

	public void save(HistoryTransferStock htStock) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(htStock);
		session.flush();
	}

	public List<HistoryTransferStock> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(HistoryTransferStock.class).list();
	}

	public HistoryTransferStock getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(HistoryTransferStock.class, id);
	}

	public void update(HistoryTransferStock htStock) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(htStock);
		session.flush();
	}

	public void delete(HistoryTransferStock htStock) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(htStock);
		session.flush();
	}

	public void saveAtauUpdate(HistoryTransferStock htStock) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(htStock);
		session.flush();
	}
}
