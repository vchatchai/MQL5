//+------------------------------------------------------------------+
//|                                       SimpleSellTrailingStop.mq5 |
//|                        Copyright 2019, MetaQuotes Software Corp. |
#include <Trade\Trade.mqh>
CTrade trade;

void OnTick()
  {
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
      
      
      if(PositionsTotal() == 0) 
      {
         trade.Sell(0.10, NULL, Bid, (Bid+1000*_Point), 0, NULL);
        
      
      }
      CheckTraillingStop(Bid);
   
  }
//+------------------------------------------------------------------+


void CheckTraillingStop(double Bid) 
   {
      double SL = NormalizeDouble(Bid+150*_Point, _Digits);
      
      for(int i=PositionsTotal()-1;i >= 0; i--)
        {
            string symbol = PositionGetSymbol(i);
            if(_Symbol == symbol)
              {
               if(PositionGetInteger(POSITION_TYPE) == ORDER_TYPE_SELL)
                 {
                     ulong PositionTicket = PositionGetInteger(POSITION_TICKET);
                     double CurrentStopLoss = PositionGetDouble(POSITION_SL);
                     
                     if(CurrentStopLoss > SL)
                     {
                        trade.PositionModify(PositionTicket, ( CurrentStopLoss - 10 *_Point),0);
                     
                     }
                  
                 }
              }
        }
   
   
   }