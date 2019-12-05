#include <Trade\Trade.mqh>


CTrade trade;

void OnTick()
  {
      double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK), _Digits);
      
      if(PositionsTotal() < 10)
        {
         trade.Buy(0.10, NULL, Ask, (Ask-1000*_Point), (Ask+150 * _Point), NULL);
        }
      
      
      if(PositionsTotal() == 10) 
      {
         CloseAllBuyPositoins();
      }
   
  }
//+------------------------------------------------------------------+



void CloseAllBuyPositoins() 
   {
      for(int i= PositionsTotal();i >= 0 ;i--)
        {
            int ticket = PositionGetTicket(i);
            
            int PositionDirection = PositionGetInteger(POSITION_TYPE);
            
            if(PositionDirection == POSITION_TYPE_BUY)
              {
                  trade.PositionClose(ticket);
              }
         
        }
   
   
   }