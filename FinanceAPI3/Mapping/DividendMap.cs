using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentNHibernate.Mapping;

namespace FinanceAPI3
{
    public class DividendMap : ClassMap<Dividend>
    {
        public DividendMap()
        {
            Table("cashhistory");
            Id(x => x.cashHistoryID);
            Map(x => x.portfolioID);
            Map(x => x.symbol);
            Map(x => x.type);
            Map(x => x.dividendDate).Column("date");
            Map(x => x.amount);
            Map(x => x.tax);
            Map(x => x.currency);
            Map(x => x.note);
        }
    }
}