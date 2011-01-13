using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentNHibernate.Mapping;

namespace FinanceAPI3
{
    public class PortfolioMap : ClassMap<Portfolio>
    {
        public PortfolioMap()
        {
            Table("portfolios");
            Id(x => x.portfolioID);
            Map(x => x.portfolioName);
            HasMany<Holding>(x => x.holdings).KeyColumn("portfolioID");
            HasMany<Deposit>(x => x.deposits).KeyColumn("portfolioID");
        }
    }
}
