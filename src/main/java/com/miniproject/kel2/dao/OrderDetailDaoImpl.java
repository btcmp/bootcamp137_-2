package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.OrderDetail;
import com.miniproject.kel2.model.PurchaseOrder;
import com.miniproject.kel2.model.RequestDetail;

@Repository
public class OrderDetailDaoImpl implements  OrderDetailDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public List<OrderDetail> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(OrderDetail.class).list();
	}

	public OrderDetail getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(OrderDetail.class, id);
	}

	public void save(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(orderDetail);
		session.flush();
	}

	public void update(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(orderDetail);
		session.flush();
	}

	public void delete(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(orderDetail);
		session.flush();
	}

	public List<OrderDetail> selectByOrder(PurchaseOrder po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from OrderDetail od where od.po.id = :poid";
		List<OrderDetail> od = session.createQuery(hql).setParameter("poid", po.getId()).list();
		if(od.isEmpty()) {
 			return null;
 		}else {
 			return od;
 		}
	}

	public List<OrderDetail> selectDetailByPo(PurchaseOrder po) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		List<OrderDetail> od = session.createCriteria(OrderDetail.class).add(Restrictions.eq("po.id", po.getId())).list(); 
 		if(od.isEmpty()) {
 			return null;
 		}else {
 			return od;
 		}
	}

}
