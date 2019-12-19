
void OnTick()
  {
//---
   
  }


void OnChartEvent(const int id,  //Event  Event-ID
                                    const long& lparam, //long event parameter
                                    const double& dparam, //double event parameter
                                    const string& sparam // strin parameter
                                    )
       {
        if(id == CHARTEVENT_KEYDOWN)
          {
            short KeyThatWasPressed = TranslateKey((int)lparam);
            
            MessageBox("The Key was: " +ShortToString(KeyThatWasPressed), "Key was pressed", MB_OK);
          }
       }