#include <Trade\Trade.mqh>

CTrade trade;


void OnTick()
  {
      double Bid = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_BID), _Digits);
      
      if ((OrdersTotal() == 0 ) && (PositionsTotal() == 0 )) {
         trade.SellStop(
         0.10,                                   //Lot size
         (Bid-(200*_Point)),                //entry price
         _Symbol,                              // current pair
         0,                                          //stop loss
         (Bid-(400*_Point)),                    //take profit
         ORDER_TIME_GTC,               //expiration date 
         0,                                           //expiration time
         "SimpleSellStop"                    //comment
         
         
         );
      
      }
   
  }
//+------------------------------------------------------------------+
