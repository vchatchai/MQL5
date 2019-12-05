#include <Trade\Trade.mqh>

CTrade trade;

void OnTick()
  {
      double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
      
      if((OrdersTotal() == 0) && (PositionsTotal()  == 0 )) 
        {
         trade.BuyStop(
                     0.10,
                     (Ask + ( 200 * _Point)), 
                     _Symbol,
                     0,
                     (Ask+(400 * _Point)),
                     ORDER_TIME_GTC,
                     0,
                     "SimpleBuyStop"
                     );
         
        }

   
  }
