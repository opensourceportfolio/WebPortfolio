using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentNHibernate.Mapping;

namespace FinanceAPI3
{
    public class PurchaseMap : ClassMap<Purchase>
    {
        public PurchaseMap()
        {
			Table("purchasehistory");
            Id(x => x.purchaseHistoryID);
            Map(x => x.portfolioID);
            Map(x => x.symbol);
            Map(x => x.shares);
            Map(x => x.transactionDate).Column("date");
            Map(x => x.price);
            Map(x => x.type);
            Map(x => x.commission);
            Map(x => x.currency);
        }
    }
}