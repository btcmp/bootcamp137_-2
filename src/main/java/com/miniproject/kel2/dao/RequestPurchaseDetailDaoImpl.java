package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.PurchaseRequest;
import com.miniproject.kel2.model.RequestDetail;

@Repository
public class RequestPurchaseDetailDaoImpl implements RequestPurchaseDetailDao{

	@Autowired
	SessionFactory sessionFactory;
	
	
	public List<RequestDetail> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(RequestDetail.class).list();
	}

	public RequestDetail getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(RequestDetail.class, id);
	}

	public void save(RequestDetail requestDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(requestDetail);
		session.flush();
	}

	public void update(RequestDetail requestDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(requestDetail);
		session.flush();
	}

	public void delete(RequestDetail requestDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(requestDetail);
		session.flush();
	}

	public List<RequestDetail> selectByRequest(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from RequestDetail rd where rd.pr.id = :prid";
		List<RequestDetail> rd = session.createQuery(hql).setParameter("prid", pr.getId()).list();
		
		return rd;
	}

	public List<RequestDetail> selectDetailByPr(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.getCurrentSession();
		//String hql = "from RequestDetail rd where rd.pr.id = :prid";
		List<RequestDetail> rd = session.createCriteria(RequestDetail.class).add(Restrictions.eq("pr.id", pr.getId())).list(); 
 		if(rd.isEmpty()) {
 			return null;
 		}else {
 			return rd;
 		}
	}


	
}
