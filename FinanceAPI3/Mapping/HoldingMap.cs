using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentNHibernate.Mapping;

namespace FinanceAPI3
{
    public class HoldingMap : ClassMap<Holding>
    {
        public HoldingMap()
        {
			Table("holdings");
            Id(x => x.holdingID);
            Map(x => x.symbol);
        }
    }
}
