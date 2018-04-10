package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.PurchaseRequest;


@Repository
public class PurchaseRequestDaoImpl implements PurchaseRequestDao {

	
	@Autowired
	SessionFactory sessionFactory;
	
	public List<PurchaseRequest> selectAll() {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(PurchaseRequest.class).list();
	}

	public PurchaseRequest getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(PurchaseRequest.class, id);
	}

	public void save(PurchaseRequest purchaseRequest) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		session.saveOrUpdate(purchaseRequest);
		session.flush();
	}

	public void update(PurchaseRequest purchaseRequest) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		session.update(purchaseRequest);
		session.flush();
	}

	public void delete(PurchaseRequest purchaseRequest) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(purchaseRequest);
		session.flush();
	}

	public void approve(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseRequest pr set pr.status = 'Approved' where pr.id.id =:prid";
		
		session.createQuery(hql).setParameter("prid", id).executeUpdate();
		
	}

	public void printed(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseRequest pr set pr.status = 'Printed' where pr.id.id =:prid";
		
		session.createQuery(hql).setParameter("prid", id).executeUpdate();
	}

	public void created(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseRequest pr set pr.status = 'Created PO' where pr.id.id =:prid";
		
		session.createQuery(hql).setParameter("prid", id).executeUpdate();
	}

	public void rejected(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseRequest pr set pr.status = 'Rejected' where pr.id.id =:prid";
		
		session.createQuery(hql).setParameter("prid", id).executeUpdate();
	}
	
	public void submit(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseRequest pr set pr.status = 'Submitted' where pr.id.id =:prid";
		
		session.createQuery(hql).setParameter("prid", id).executeUpdate();
	}


	public int jumlahPr(PurchaseRequest pr) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where prNo = :prNo";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("prNo", pr).list();
		if(prs.isEmpty()) {
		return 0;
		}
		return prs.size();
	}

	
	public int CountPRByMonth(int bulan, int tahun) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where MONTH(createdOn) = :month and YEAR(createdOn) = :year";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("month", bulan).setParameter("year", tahun).list();
		if(prs.isEmpty()) {
			return 0;
		}
		return prs.size();
	}

	public int CountPrByPrNo(String prNo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseRequest where prNo = :prNo";
		List<PurchaseRequest> prs = session.createQuery(hql).setParameter("prNo", prNo).list();
		if(prs.isEmpty()) {
			return 0;
		}
		return prs.size();
	}

	
}
