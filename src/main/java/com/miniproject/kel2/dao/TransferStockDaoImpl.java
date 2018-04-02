package com.miniproject.kel2.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.miniproject.kel2.model.Outlet;
import com.miniproject.kel2.model.TransferStock;

@Repository
public class TransferStockDaoImpl implements TransferStockDao {

	@Autowired
	SessionFactory sessionFactory;
	
	public void save(TransferStock transferStock) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(transferStock);
		session.flush();
	}

	public List<TransferStock> selectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(TransferStock.class).list();
	}

	/*public TransferStock getOne(long id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.get(TransferStock.class, id);
	}*/
	
	public TransferStock getOne(TransferStock transferStock) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(TransferStock.class, transferStock.getId());
	}

	public void update(TransferStock transferStock) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.update(transferStock);
		session.flush();
	}

	public void delete(TransferStock transferStock) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.delete(transferStock);
		session.flush();
	}

	public void saveUpdate(TransferStock transferStock) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(transferStock);
		session.flush();
	}

	// Untuk list outlet
	public List<Outlet> outSelectAll() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(Outlet.class).list();
	}

	public List<TransferStock> getByOutletId(long search) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		String hql = "from TransferStock ts where ts.toOutlet.id = :search";
		List<TransferStock> tStocks = session.createQuery(hql).setParameter("search", search).list();
		if (tStocks.isEmpty()) {
			return null;
		} else {
			return tStocks;
		}
	}

}
