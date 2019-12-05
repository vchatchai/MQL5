

#include<Trade\Trade.mqh>

CTrade trade;

void OnTick()
  {
      double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK) ,_Digits);
      
      
      
      if(PositionsTotal() == 0) 
        {
          trade.Buy(0.10, NULL, Ask, (Ask - 1000 * _Point), 0, NULL );
        }
      
      CheckTrailingStop(Ask);

   
  }


void CheckTrailingStop(double Ask) 
{
   double SL = NormalizeDouble(Ask-150*_Point, _Digits);
   for(int i=PositionsTotal() - 1 ;i>=0;i--)
     {
      string symbol = PositionGetSymbol(i);
      if(_Symbol == symbol)
         {
         
            ulong  PositionTicket = PositionGetInteger(POSITION_TICKET);
            double CurrentStopLoss=PositionGetDouble(POSITION_SL);
         
            if(CurrentStopLoss < SL)
              {
                  trade.PositionModify(PositionTicket,  (CurrentStopLoss + 10 * _Point), 0);
               
              }
         
         }
      
     }


}