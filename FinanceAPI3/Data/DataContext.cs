﻿using NHibernate;
using FluentNHibernate.Cfg;
using FluentNHibernate.Cfg.Db;
using System.Collections.Generic;
using System.Linq;
using NHibernate.Linq;
using System.Linq.Expressions;
using System;
using NHibernate.Criterion.Lambda;

namespace FinanceAPI3
{
    public class DataContext
    {
        ISession _session;
        double _exchangeRate;

        public DataContext(double exchangeRate)
        {
            var sessionFactory = CreateSessionFactory();
            _session = sessionFactory.OpenSession();
            _exchangeRate = exchangeRate;
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
                          shares = Math.Round(quote.Sum(q => q.shares),2),
                          Symbol = quote.Key,
                          totalCost = Math.Round(quote.Sum(q => q.shares * q.price + q.commission),2),
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
            return _session.Query<Purchase>().Where(validPurchase(pID, symbol)).ToList();
        }

        private double getTotalCash(int portfolioID, double exchangeRate, string resultingCurrency)
        {
            var deposits = _session.QueryOver<Deposit>()
                            .Where(validPID<Deposit>(portfolioID))
                            .SelectList(list => list
                                .SelectGroup(c => c.currency)
                                .SelectSum(c => c.amount))
                            .List<object[]>();

            var dividends = _session.QueryOver<Dividend>()
                            .Where(validPID<Dividend>(portfolioID))
                            .SelectList(list => list
                                .SelectGroup(c => c.currency)
                                .SelectSum(c => c.amount)                               
                                .SelectSum(c => c.tax))                               
                            .List<object[]>()                            
                            .Select(p => new object[2]{
                                p[0].ToString(),
                                double.Parse(p[1].ToString()) - double.Parse(p[2].ToString())
                            }).ToList();

            var purchases = (from p in _session.QueryOver<Purchase>()
                                        .Where(validPID<Purchase>(portfolioID)).List().ToList()
                             group p by p.currency into currencies
                             select new object[2] {
                                currencies.Key, 
                                currencies.Sum(f => -1*f.price*f.shares - f.commission)
                            }).ToList();

            return Math.Round(sumCurrencies(deposits) + sumCurrencies(dividends) + sumCurrencies(purchases),2);
        }

        public double getTotalCost(int pID, double exchangeRate, string resultingCurrency)
        {
            var currencies = _session.QueryOver<Deposit>()
                        .Where(validDeposit(pID))
                        .SelectList(list => list
                            .SelectGroup(c => c.currency)
                            .SelectSum(c => c.amount)).List<object[]>();

            return sumCurrencies(currencies);
        }

        #region Expressions

        private Expression<Func<T, bool>> validPID<T>(int pID) where T : IPortfolio
        {
            Expression<Func<T, bool>> expression;
            if (pID == 1)
            {
                expression = p => p.portfolioID > pID;
            }
            else
            {
                expression = p => p.portfolioID == pID;
            }

            return expression;
        }

        private Expression<Func<Deposit, bool>> validDeposit(int pID)
        {
            Expression<Func<Deposit, bool>> checkDeposit;
            Expression<Func<Deposit, bool>> checkPID = validPID<Deposit>(pID);
            checkDeposit = p => p.type == "DEPOSIT";
            var body = Expression.AndAlso(checkDeposit.Body, checkPID.Body);
            return Expression.Lambda<Func<Deposit, bool>>(body, checkDeposit.Parameters[0]);
        }

        private Expression<Func<Purchase, bool>> validPurchase(int pID, string symbol)
        {
            Expression<Func<Purchase, bool>> checkSymbol;
            Expression<Func<Purchase, bool>> checkPID = validPID<Purchase>(pID);
            checkSymbol = p => p.symbol == symbol;
            var body = Expression.AndAlso(checkSymbol.Body, checkPID.Body);
            return Expression.Lambda<Func<Purchase, bool>>(body, checkSymbol.Parameters[0]);
        }

        #endregion

        private double sumCurrencies(IList<object[]> o)
        {
            var currencies = o.Select(q => new {currency = q[0].ToString(),
                                sum = double.Parse(q[1].ToString())})
                                .OrderBy(q => q.currency).ToList();
            return Math.Round(currencies[1].sum * _exchangeRate + currencies[0].sum,2);
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