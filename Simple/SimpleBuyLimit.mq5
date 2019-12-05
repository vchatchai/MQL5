#include <Trade\Trade.mqh>

CTrade trade;
void OnTick()
  {
  
      // get ask price
      double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK), _Digits);
      
      
      if( (OrdersTotal() == 0 ) && (PositionsTotal() == 0) ) { 
         trade.BuyLimit(
            0.10,  //lo size
            (Ask - ( 200* _Point)),   //price for buy limit
            _Symbol,  // get the symbol
            0,   //Stop Loss
            (Ask+ (200 *_Point)), // Take Profit 
            ORDER_TIME_GTC,   //expiration date 
            0,    //expiration time
            "SimpleBuyList" // Comment
         
         
         );
      
      
      }
   
  }
