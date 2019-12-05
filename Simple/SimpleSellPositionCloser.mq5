#include <Trade\Trade.mqh>

CTrade trade;

void OnTick()
  {
   double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID), _Digits);
   
   if(PositionsTotal() < 10) 
   {
      trade.Sell(0.10, NULL, Bid, (Bid+1000 *_Point), (Bid-150 * _Point), NULL);
   
   }

   if(PositionsTotal() == 10)
     {
         CloseAllSellPostions();
     }
   
  }
  
 void CloseAllSellPostions() 
 {
   for(int i=PositionsTotal() - 1;i >=0;i--)
     {
      int ticket = PositionGetTicket(i);
      
      int PositionDirection = PositionGetInteger(POSITION_TYPE);
      
      if( PositionDirection ==POSITION_TYPE_SELL) 
        {
            trade.PositionClose(ticket);
        }
      
     }
 
 }