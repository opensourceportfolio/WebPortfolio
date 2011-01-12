using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FinanceAPI3
{
    public class Deposit : IPortfolio
    {
        public virtual int depositHistoryID { get; private set; }
        public virtual int portfolioID { get; set; }
        public virtual string type { get; set; }
        public virtual string depositDate { get; set; }
        public virtual double amount { get; set; }
        public virtual char currency { get; set; }
        public virtual string note { get; set; }
    }
}
