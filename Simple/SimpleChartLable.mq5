void OnTick()
  {

   double Ask = NormalizeDouble(SymbolInfoDouble(_Symbol, SYMBOL_ASK), _Digits);
   
   ObjectCreate(0, "Lable1", OBJ_LABEL, 0, 0, 0 );
   ObjectSetString(0, "Label1", OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"Label1",OBJPROP_FONTSIZE, 24);
   ObjectSetString(0, "Lable1", OBJPROP_TEXT, "Ask Price:" + Ask);
   ObjectSetInteger(0, "Label1", OBJPROP_XDISTANCE, 15);
   ObjectSetInteger(0, "Label1", OBJPROP_YDISTANCE, 10);
  }
