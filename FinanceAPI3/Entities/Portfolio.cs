using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FinanceAPI3
{
    public class Portfolio
    {
        public virtual int portfolioID { get; set; }
        public virtual string portfolioName { get; set; }
        public virtual IList<Holding> holdings { get; set; }
        public virtual IList<Deposit> deposits { get; set; }

        public Portfolio()
        {
            holdings = new List<Holding>();
            deposits = new List<Deposit>();
        }

        public virtual void addHolding(Holding holding)
        {
            holdings.Add(holding);
        }

        public virtual void addDeposit(Deposit deposit)
        {
            deposits.Add(deposit);
        }
    }
}
