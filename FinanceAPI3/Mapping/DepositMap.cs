using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentNHibernate.Mapping;

namespace FinanceAPI3
{
    public class DepositMap : ClassMap<Deposit>
    {
        public DepositMap()
        {
            Table("deposithistory");
            Id(x => x.depositHistoryID);
            Map(x => x.portfolioID);
            Map(x => x.type);
            Map(x => x.depositDate).Column("date");
            Map(x => x.amount);
            Map(x => x.currency);
            Map(x => x.note);
        }
    }
}
