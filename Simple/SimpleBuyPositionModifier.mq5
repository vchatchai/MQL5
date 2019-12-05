#include <Trade\Trade.mqh>

CTrade trade;

void OnTick()
  {
   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK), _Digits);
   
   if(PositionsTotal() == 0 )
   {
      trade.Buy(0.10, NULL, Ask, (Ask-1000*_Point), (Ask+500 * _Point), NULL );
   }
   
      ChangePositionSize(Ask);
   
  }
  
 void ChangePositionSize(double Ask ) 
 {
   double Balance = AccountInfoDouble(ACCOUNT_BALANCE);
   
   double Equity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   for(int i=PositionsTotal() -1 ;i >= 0;i--)
     {
         string symbol = PositionGetSymbol(i);
         if(_Symbol == symbol)
         {
            ulong PositionTicket = PositionGetInteger(POSITION_TICKET);
            
            int PositionDirection = PositionGetInteger(POSITION_TYPE);
            
            if(POSITION_TYPE_BUY == PositionDirection)
              {
               if(Balance < (Equity + 10 * _Point))
                 {
                     trade.PositionClosePartial(PositionTicket, 0.10, -1);
                 }
              }
         }
     }
 
 }