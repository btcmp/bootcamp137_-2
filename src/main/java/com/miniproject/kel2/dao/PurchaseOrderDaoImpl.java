package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.Adjustment;
import com.miniproject.kel2.model.PurchaseOrder;
import com.miniproject.kel2.model.PurchaseRequest;

@Repository
public class PurchaseOrderDaoImpl implements PurchaseOrderDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public List<PurchaseOrder> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(PurchaseOrder.class).list();
	}

	public PurchaseOrder getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(PurchaseOrder.class, id);
	}

	public void save(PurchaseOrder purchaseOrder) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		session.saveOrUpdate(purchaseOrder);
		session.flush();
	}

	public void update(PurchaseOrder purchaseOrder) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.clear();
		session.update(purchaseOrder);
		session.flush();
	}

	public void delete(PurchaseOrder purchaseOrder) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(purchaseOrder);
		session.flush();
	}

	public void approve(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseOrder po set po.status = 'Approved' where po.id.id =:poid";
		
		session.createQuery(hql).setParameter("poid", id).executeUpdate();
	}

	public void rejected(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseOrder po set po.status = 'Rejected' where po.id.id =:poid";
		
		session.createQuery(hql).setParameter("poid", id).executeUpdate();
	}

	public void process(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseOrder po set po.status = 'Process' where po.id.id =:poid";
		
		session.createQuery(hql).setParameter("poid", id).executeUpdate();
	}

	public void Print(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "update PurchaseOrder po set po.status = 'Printed' where po.id.id =:poid";
		
		session.createQuery(hql).setParameter("poid", id).executeUpdate();
	}

	public List<PurchaseOrder> searchByStatus(PurchaseOrder po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from PurchaseOrder po where po.status = :status";
		List<PurchaseOrder> hasilStatus= session.createQuery(hql).setParameter("status", po.getStatus()).list();
		if(hasilStatus.isEmpty()) {
			return null;
		}else {
			return hasilStatus;
		}
	}

}
