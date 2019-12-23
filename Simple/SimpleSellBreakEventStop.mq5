#include<Trade\Trade.mqh>

CTrade trade;
void OnTick()
  {
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
      
      if(PositionsTotal() == 0 )
      {
         trade.Sell(0.10, NULL, Bid, Bid+300 *_Point, Bid-300*_Point, NULL );
      
      }
      
      CheckSellBreakEventStop(Bid);
   
   
  }
  
 void CheckSellBreakEventStop(double Bid)
 {
   for(int i=PositionsTotal() - 1; i>=0;i--)
     {
         ulong PositionTicket = PositionGetInteger(POSITION_TICKET);
         
         double PositionBuyPrice = PositionGetDouble(POSITION_SL);
         
         double PositionStopLoss = PositionGetDouble(POSITION_SL);
         
         double PositionTakeProfit = PositionGetDouble(POSITION_TP);
         
         double PositionType = PositionGetInteger(POSITION_TYPE);
         
         
         string symbol = PositionGetSymbol(i);
         
         if(_Symbol == symbol) 
         if(PositionType == POSITION_TYPE_SELL)
         if(PositionStopLoss > PositionBuyPrice)
         if(Bid < (PositionBuyPrice - 30 * _Point))
           {
               trade.PositionModify(PositionTicket,PositionBuyPrice - 4 * _Point, PositionTakeProfit );
           }
           
     }
 
 
 }