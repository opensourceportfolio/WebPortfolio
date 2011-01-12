﻿using NHibernate;
using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;
using System.Collections.Generic;
using System.Linq;
using NHibernate.Linq;
using System.Linq.Expressions;
using System;

namespace FinanceAPI3
{
    class DataContext
    {
        ISession _session;
        
        public DataContext()
        {
            var sessionFactory = CreateSessionFactory();
            _session = sessionFactory.OpenSession();            
        }

        public List<Portfolio> getPortfolios()
        {
            return _session.Query<Portfolio>().ToList();
        }

        public List<Purchase> getAllPurchases(int pID)
        {
            return _session.Query<Purchase>()
                .Where(validPID<Purchase>(pID)).ToList();
        }

        public List<Quote> getHoldings(int portfolioID, double exchangeRate, string resultingCurrency)
        {
            List<Purchase> purchases;
            List<Quote> quotes;
			
			purchases = _session.Query<Purchase>()
							.Where(validPID<Purchase>(portfolioID)).ToList();

            quotes = (from purchase in purchases
                      group purchase by purchase.symbol into quote
                      select new Quote()
                      {
                          shares = quote.Sum(q => q.shares),
                          Symbol = quote.Key,
                          totalCost = 0,
                          purchases = quote.ToList()
                      }).ToList();
            quotes.Add(new Quote()
            {
                shares = 0,
                Symbol = "CASH",
                totalCost = getTotalCash(portfolioID, exchangeRate, resultingCurrency)
            });
            return quotes;
        }

        public List<Purchase> getPurchaseHistroy(int pID, string symbol)
        {
			return _session.Query<Purchase>().Where(validPurchase(pID,symbol)).ToList();           
        }

        private double getTotalCash(int portfolioID, double exchangeRate, string resultingCurrency)
        {
            return 1; //not implemented
        }
		
		private Expression<Func<T,bool>> validPID<T>(int pID) where T: IPortfolio{
			Expression<Func<T,bool>> expression;
			if (pID == 1)
			{
				expression = item => item.portfolioID == item.portfolioID;
			}
			else{
				expression = item => item.portfolioID == pID;
			}
			
			return expression;
		}

        public double getTotalCost(int pID, double exchangeRate, string resultingCurrency)
        {
            var american = _session.QueryOver<Deposit>()
                        .Where(validDeposit(pID,'U'))
                        .SelectList(list => list
                            .SelectSum(c => c.amount)).List<object>()
                        .Select(q => double.Parse(q.ToString())).SingleOrDefault();

            var canadian = _session.QueryOver<Deposit>()
                        .Where(validDeposit(pID,'C'))
                        .SelectList(list => list
                            .SelectSum(c => c.amount)).List<object>()
                        .Select(q => double.Parse(q.ToString())).SingleOrDefault();

            return american*exchangeRate + canadian;
        }
		
		private Expression<Func<Deposit, bool>> validDeposit(int pID,char currency)
		{
			Expression<Func<Deposit, bool>> checkDeposit;
			Expression<Func<Deposit, bool>> checkPID = validPID<Deposit>(pID);
			checkDeposit = d => d.currency == currency && d.type == "DEPOSIT";
			var body = Expression.AndAlso(checkDeposit.Body, checkPID.Body);		
			return Expression.Lambda<Func<Deposit,bool>>(body,checkDeposit.Parameters[0]);
		}
		
		private Expression<Func<Purchase, bool>> validPurchase(int pID, string symbol)
		{
			Expression<Func<Purchase, bool>> checkSymbol;
			Expression<Func<Purchase, bool>> checkPID = validPID<Purchase>(pID);
			checkSymbol = p => p.symbol == symbol;
			var body = Expression.AndAlso(checkSymbol.Body, checkPID.Body);		
			return Expression.Lambda<Func<Purchase,bool>>(body,checkSymbol.Parameters[0]);			
		}


        private static ISessionFactory CreateSessionFactory()
        {
            return Fluently.Configure()
                .Database(MySQLConfiguration.Standard.ConnectionString(c => c.FromConnectionStringWithKey("MySQLConnection")))
                .Mappings(m => m.FluentMappings.AddFromAssemblyOf<Portfolio>())
                .BuildSessionFactory();
        }
    }
}