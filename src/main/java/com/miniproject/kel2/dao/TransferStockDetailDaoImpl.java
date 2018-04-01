package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.TransferStockDetail;

@Repository
public class TransferStockDetailDaoImpl implements TransferStockDetailDao{
	
	@Autowired
	SessionFactory sessionFactory;

	public void save(TransferStockDetail tsDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(tsDetail);
		session.flush();
	}

	public List<TransferStockDetail> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(TransferStockDetail.class).list();
	}

/*	public TransferStockDetail getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(TransferStockDetail.class, id);
	}*/
	
	public TransferStockDetail getOne(TransferStockDetail tsDetail) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(TransferStockDetail.class, tsDetail.getId());
	}

	public void update(TransferStockDetail tsDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(tsDetail);
		session.flush();
	}

	public void delete(TransferStockDetail tsDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(tsDetail);
		session.flush();
	}

	public void saveAtauUpdate(TransferStockDetail tsDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(tsDetail);
		session.flush();
	}

	// untuk search
	public List<TransferStockDetail> searchById(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from TransferStockDetail tsd where tsd.transferStock.id = :id";
		List<TransferStockDetail> tsDetails = session.createQuery(hql).setParameter("id", id).list();
		if(tsDetails.isEmpty()) {
				return null;
		} else {
			return tsDetails;
		}
	}
	
	public List<TransferStockDetail> getTransferStockById(long search) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from TransferStockDetail tsd where tsd.transferStock.id = :search";
		List<TransferStockDetail> tsDetails = session.createQuery(hql).setParameter("search", search).list();
		if(tsDetails.isEmpty()) {
			return null;
		} else {
			return tsDetails;
		}
	
	}

}
