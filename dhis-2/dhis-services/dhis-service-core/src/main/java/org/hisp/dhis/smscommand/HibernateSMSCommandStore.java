package org.hisp.dhis.smscommand;

import java.util.Collection;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hisp.dhis.sms.parse.ParserType;
import org.springframework.beans.factory.annotation.Required;

public class HibernateSMSCommandStore
    implements SMSCommandStore
{

    protected SessionFactory sessionFactory;

    @Required
    public void setSessionFactory( SessionFactory sessionFactory )
    {
        this.sessionFactory = sessionFactory;
    }

    @SuppressWarnings( "unchecked" )
    @Override
    public Collection<SMSCommand> getSMSCommands()
    {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria( SMSCommand.class );
        criteria.addOrder( Order.asc( "name" ) );
        return criteria.list();
    }

    public int save( SMSCommand cmd )
    {
        Session s = sessionFactory.getCurrentSession();
        Transaction t = s.beginTransaction();
        s.saveOrUpdate( cmd );
        t.commit();
        s.flush();
        return 0;
    }

    public void save( Set<SMSCode> codes )
    {
        Session s = sessionFactory.getCurrentSession();
        Transaction t = s.beginTransaction();
        for ( SMSCode x : codes )
        {
            s.saveOrUpdate( x );
        }
        t.commit();
        s.flush();
    }

    public SMSCommand getSMSCommand( int id )
    {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria( SMSCommand.class );
        criteria.add( Restrictions.eq( "id", id ) );
        
        if ( criteria.list() != null && criteria.list().size() > 0 )
        {
            return (SMSCommand) criteria.list().get( 0 );
        }
        
        return null;
    }

    public void delete( SMSCommand cmd )
    {
        Session s = sessionFactory.getCurrentSession();
        Transaction t = s.beginTransaction();
        for ( SMSCode x : cmd.getCodes() )
        {
            s.delete( x );
        }
        s.delete( cmd );
        t.commit();
        s.flush();
    }
    
    @SuppressWarnings( "unchecked" )
    @Override
    public Collection<SMSCommand> getJ2MESMSCommands()
    {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria( SMSCommand.class );
        criteria.add( Restrictions.eq( "parserType", ParserType.J2ME_PARSER ) );
        return criteria.list();
    }
}
