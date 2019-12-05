#include<Trade\Trade.mqh>

CTrade trade;
void OnTick()
  {
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID),_Digits);
      
      if(PositionsTotal() == 0)
        {
            trade.Sell(1,NULL, Bid, (Bid+1000*_Point), "SimpleSellPositionModifier");
            
        }
        
        ChangePositionSize(Bid);
   
   
   
  }
  
  void ChangePositionSize(double Bid)
  {
      double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
      
      double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
      
      for(int i=PositionsTotal() -1 ;i >= 0 ;i--)
        {
            string symbol = PositionGetSymbol(i);
            if(_Symbol==symbol)
            {
               ulong PositionTicket = PositionGetInteger(POSITION_TICKET);
               
               int PositionDirect = PositionGetInteger(POSITION_TYPE);
               
               if(Balance< (Equity+10 *_Point))
                 {
                  trade.PositionClosePartial(PositionTicket,0.1, -1);
                 }
            
            }
        }
  }