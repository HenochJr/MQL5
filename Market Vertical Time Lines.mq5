//+------------------------------------------------------------------+
//|                                   Market Vertical Time Lines.mq5 |
//|                                       Copyright 2020, Henoch Jr. |
//|                    https://www.mql5.com/pt/users/henochjr/seller |
//|                                                                  |
//| By Henoch Jr.                                                    |
//+------------------------------------------------------------------+
#property copyright     "Copyright 2020, Henoch Jr."
#property link          "https://www.mql5.com/pt/users/henochjr/seller"
#property version       "1.00"
#property icon          "MVTL.ico"
#property description   "This indicator shows in a simple and objective way the"
#property description   "opening hours of the main exchanges in the world.\n"
#property description   "Define the number of days to be displayed and choose the"
#property description   "options available for the appearance of each vertical line"
#property description   "of each market in the indicator."
#property indicator_chart_window
#property indicator_plots 0

enum LW
{One = 1, Two = 2, Three = 3, Four = 4, Five = 5};   

// DEFAULT INPUTS : START
//-----------------------------------------------------
input int Historical_Days = 5;                  // Historical days
  
input string T1_End = "Frankfurt";              // Line 1  Name
input color  Line_1_Color = clrWhite;           // Line 1  Color 
input bool   Line_1_Visible = true;             // Line 1  Visible
input bool   Line_1_Backgroud = true;           // Line 1  Background
input string Line_1_Time = "09:00";             // Line 1  Time
input LW     Line_1_Width = One;                // Line 1  Width
input ENUM_LINE_STYLE Line_1_Style = STYLE_DOT; // Line 1  Style
input string Font_1_Type = "Verdana";           // Line 1  Font Type
input int    Font_1_Size = 8;                   // Line 1  Font Size
input double Font_1_Angle = 0.0;                // Line 1  Font Angle

input string T2_End = "London";                 // Line 2  Name
input color  Line_2_Color = clrWhite;           // Line 2  Color
input bool   Line_2_Visible = true;             // Line 2  Visible
input bool   Line_2_Backgroud = true;           // Line 2  Background
input string Line_2_Time = "10:00";             // Line 2  Time 
input LW     Line_2_Width = One;                // Line 2  Width
input ENUM_LINE_STYLE Line_2_Style = STYLE_DOT; // Line 2  Style
input string Font_2_Type = "Verdana";           // Line 2  Font Type
input int    Font_2_Size = 8;                   // Line 2  Font Size
input double Font_2_Angle = 0.0;                // Line 2  Font Angle

input string T3_End = "New York";               // Line 3  Name
input color  Line_3_Color = clrWhite;           // Line 3  Color
input bool   Line_3_Visible = true;             // Line 3  Visible
input bool   Line_3_Backgroud = true;           // Line 3  Background
input string Line_3_Time = "15:00";             // Line 3  Time
input LW     Line_3_Width = One;                // Line 3  Width
input ENUM_LINE_STYLE Line_3_Style = STYLE_DOT; // Line 3  Style
input string Font_3_Type = "Verdana";           // Line 3  Font Type
input int    Font_3_Size = 8;                   // Line 3  Font Size
input double Font_3_Angle = 0.0;                // Line 3  Font Angle

input string T4_End = "Sydney";                 // Line 4  Name
input color  Line_4_Color = clrWhite;           // Line 4  Color
input bool   Line_4_Visible = true;             // Line 4  Visible
input bool   Line_4_Backgroud = true;           // Line 4  Background
input string Line_4_Time = "01:00";             // Line 4  Time
input LW     Line_4_Width = One;                // Line 4  Width
input ENUM_LINE_STYLE Line_4_Style = STYLE_DOT; // Line 4  Style
input string Font_4_Type = "Verdana";           // Line 4  Font Type
input int    Font_4_Size = 8;                   // Line 4  Font Size
input double Font_4_Angle = 0.0;                // Line 4  Font Angle

input string T5_End = "Tokyo";                  // Line 5  Name
input color  Line_5_Color = clrWhite;           // Line 5  Color
input bool   Line_5_Visible = true;             // Line 5  Visible
input bool   Line_5_Backgroud = true;           // Line 5  Background
input string Line_5_Time = "02:00";             // Line 5  Time
input LW     Line_5_Width = One;                // Line 5  Width
input ENUM_LINE_STYLE Line_5_Style = STYLE_DOT; // Line 5  Style
input string Font_5_Type = "Verdana";           // Line 5  Font Type
input int    Font_5_Size = 8;                   // Line 5  Font Size
input double Font_5_Angle = 0.0;                // Line 5  Font Angle

input string T6_End = "None";                   // Line 6  Name
input color  Line_6_Color = clrWhite;           // Line 6  Color
input bool   Line_6_Visible = false;            // Line 6  Visible
input bool   Line_6_Backgroud = true;           // Line 6  Background
input string Line_6_Time = "00:00";             // Line 6  Time
input LW     Line_6_Width = One;                // Line 6  Width
input ENUM_LINE_STYLE Line_6_Style = STYLE_DOT; // Line 6  Style
input string Font_6_Type = "Verdana";           // Line 6  Font Type
input int    Font_6_Size = 8;                   // Line 6  Font Size
input double Font_6_Angle = 0.0;                // Line 6  Font Angle

//----------------------------------------------------- 

int OnInit()
{
  DeleteObjectsLines();
  DeleteObjectsText();
  for (int i=0; i<Historical_Days; i++) 
  {
     CreateObjectsLines("T1"+IntegerToString(i), Line_1_Color);
     ObjectSetInteger(0, "T1"+IntegerToString(i), OBJPROP_WIDTH, Line_1_Width);
     ObjectSetInteger(0, "T1"+IntegerToString(i), OBJPROP_STYLE, Line_1_Style);
     ObjectSetInteger(0, "T1"+IntegerToString(i), OBJPROP_BACK, Line_1_Backgroud);
     CreateObjectsText("Text1"+IntegerToString(i), Line_1_Color);
     ObjectSetString (0, "Text1"+IntegerToString(i), OBJPROP_TEXT, " " + T1_End + " ");
     ObjectSetString (0, "Text1"+IntegerToString(i), OBJPROP_FONT, Font_1_Type);
     ObjectSetInteger(0, "Text1"+IntegerToString(i), OBJPROP_FONTSIZE, Font_1_Size);
     ObjectSetDouble (0, "Text1"+IntegerToString(i), OBJPROP_ANGLE, Font_1_Angle);
     ObjectSetInteger(0, "Text1"+IntegerToString(i), OBJPROP_ANCHOR, ANCHOR_RIGHT);
     ObjectSetInteger(0, "Text1"+IntegerToString(i), OBJPROP_COLOR, Line_1_Color);
              
     CreateObjectsLines("T2"+IntegerToString(i), Line_2_Color);
     ObjectSetInteger(0, "T2"+IntegerToString(i), OBJPROP_WIDTH, Line_2_Width);
     ObjectSetInteger(0, "T2"+IntegerToString(i), OBJPROP_STYLE, Line_2_Style);
     ObjectSetInteger(0, "T2"+IntegerToString(i), OBJPROP_BACK, Line_2_Backgroud);
     CreateObjectsText("Text2"+IntegerToString(i), Line_2_Color);
     ObjectSetString (0, "Text2"+IntegerToString(i), OBJPROP_TEXT, " " + T2_End + " ");
     ObjectSetString (0, "Text2"+IntegerToString(i), OBJPROP_FONT, Font_2_Type);
     ObjectSetInteger(0, "Text2"+IntegerToString(i), OBJPROP_FONTSIZE, Font_2_Size);
     ObjectSetDouble (0, "Text2"+IntegerToString(i), OBJPROP_ANGLE, Font_2_Angle);
     ObjectSetInteger(0, "Text2"+IntegerToString(i), OBJPROP_ANCHOR, ANCHOR_RIGHT);
     ObjectSetInteger(0, "Text2"+IntegerToString(i), OBJPROP_COLOR, Line_2_Color);     
     
     CreateObjectsLines("T3"+IntegerToString(i), Line_3_Color);
     ObjectSetInteger(0, "T3"+IntegerToString(i), OBJPROP_WIDTH, Line_3_Width);
     ObjectSetInteger(0, "T3"+IntegerToString(i), OBJPROP_STYLE, Line_3_Style);
     ObjectSetInteger(0, "T3"+IntegerToString(i), OBJPROP_BACK, Line_3_Backgroud);
     CreateObjectsText("Text3"+IntegerToString(i), Line_3_Color);
     ObjectSetString (0, "Text3"+IntegerToString(i), OBJPROP_TEXT, " " + T3_End + " ");
     ObjectSetString (0, "Text3"+IntegerToString(i), OBJPROP_FONT, Font_3_Type);
     ObjectSetInteger(0, "Text3"+IntegerToString(i), OBJPROP_FONTSIZE, Font_3_Size);
     ObjectSetDouble (0, "Text3"+IntegerToString(i), OBJPROP_ANGLE, Font_3_Angle);
     ObjectSetInteger(0, "Text3"+IntegerToString(i), OBJPROP_ANCHOR, ANCHOR_RIGHT);
     ObjectSetInteger(0, "Text3"+IntegerToString(i), OBJPROP_COLOR, Line_3_Color);     
     
     CreateObjectsLines("T4"+IntegerToString(i), Line_4_Color);
     ObjectSetInteger(0, "T4"+IntegerToString(i), OBJPROP_WIDTH, Line_4_Width);
     ObjectSetInteger(0, "T4"+IntegerToString(i), OBJPROP_STYLE, Line_4_Style);
     ObjectSetInteger(0, "T4"+IntegerToString(i), OBJPROP_BACK, Line_4_Backgroud);
     CreateObjectsText("Text4"+IntegerToString(i), Line_4_Color);
     ObjectSetString (0, "Text4"+IntegerToString(i), OBJPROP_TEXT, " " + T4_End + " ");
     ObjectSetString (0, "Text4"+IntegerToString(i), OBJPROP_FONT, Font_4_Type);
     ObjectSetInteger(0, "Text4"+IntegerToString(i), OBJPROP_FONTSIZE, Font_4_Size);
     ObjectSetDouble (0, "Text4"+IntegerToString(i), OBJPROP_ANGLE, Font_4_Angle);
     ObjectSetInteger(0, "Text4"+IntegerToString(i), OBJPROP_ANCHOR, ANCHOR_RIGHT);
     ObjectSetInteger(0, "Text4"+IntegerToString(i), OBJPROP_COLOR, Line_4_Color);     
     
     CreateObjectsLines("T5"+IntegerToString(i), Line_5_Color);
     ObjectSetInteger(0, "T5"+IntegerToString(i), OBJPROP_WIDTH, Line_5_Width);
     ObjectSetInteger(0, "T5"+IntegerToString(i), OBJPROP_STYLE, Line_5_Style);
     ObjectSetInteger(0, "T5"+IntegerToString(i), OBJPROP_BACK, Line_5_Backgroud);
     CreateObjectsText("Text5"+IntegerToString(i), Line_5_Color);
     ObjectSetString (0, "Text5"+IntegerToString(i), OBJPROP_TEXT, " " + T5_End + " ");
     ObjectSetString (0, "Text5"+IntegerToString(i), OBJPROP_FONT, Font_5_Type);
     ObjectSetInteger(0, "Text5"+IntegerToString(i), OBJPROP_FONTSIZE, Font_5_Size);
     ObjectSetDouble (0, "Text5"+IntegerToString(i), OBJPROP_ANGLE, Font_5_Angle);
     ObjectSetInteger(0, "Text5"+IntegerToString(i), OBJPROP_ANCHOR, ANCHOR_RIGHT);
     ObjectSetInteger(0, "Text5"+IntegerToString(i), OBJPROP_COLOR, Line_5_Color);
     
     CreateObjectsLines("T6"+IntegerToString(i), Line_6_Color);
     ObjectSetInteger(0, "T6"+IntegerToString(i), OBJPROP_WIDTH, Line_6_Width);
     ObjectSetInteger(0, "T6"+IntegerToString(i), OBJPROP_STYLE, Line_6_Style);
     ObjectSetInteger(0, "T6"+IntegerToString(i), OBJPROP_BACK, Line_6_Backgroud);
     CreateObjectsText("Text6"+IntegerToString(i), Line_6_Color);
     ObjectSetString (0, "Text6"+IntegerToString(i), OBJPROP_TEXT, " " + T6_End + " ");
     ObjectSetString (0, "Text6"+IntegerToString(i), OBJPROP_FONT, Font_6_Type);
     ObjectSetInteger(0, "Text6"+IntegerToString(i), OBJPROP_FONTSIZE, Font_6_Size);
     ObjectSetDouble (0, "Text6"+IntegerToString(i), OBJPROP_ANGLE, Font_6_Angle);
     ObjectSetInteger(0, "Text6"+IntegerToString(i), OBJPROP_ANCHOR, ANCHOR_RIGHT);
     ObjectSetInteger(0, "Text6"+IntegerToString(i), OBJPROP_COLOR, Line_6_Color);          
  }

   return(INIT_SUCCEEDED);
}

void deinit() 
{
  DeleteObjectsLines();
  DeleteObjectsText();
}

void CreateObjectsLines(string no, color cl)
{
  ObjectCreate(0, no, OBJ_VLINE, 0, 0, 0, 0, 0);
  ObjectSetInteger(0, no, OBJPROP_COLOR, cl);
  ObjectSetInteger(0, no, OBJPROP_BACK, false);
}

void CreateObjectsText(string txt, color cltxt)
{
  ObjectCreate(0, txt, OBJ_TEXT, 0, 0, 0, 0, 0);
  ObjectSetInteger(0, txt, OBJPROP_COLOR, cltxt);
  ObjectSetInteger(0, txt, OBJPROP_BACK, false);   
}

void DeleteObjectsLines()
{
  for (int i=0; i<Historical_Days; i++) 
  {
    ObjectDelete(0,"T1"+IntegerToString(i));
    ObjectDelete(0,"T2"+IntegerToString(i));
    ObjectDelete(0,"T3"+IntegerToString(i));
    ObjectDelete(0,"T4"+IntegerToString(i));
    ObjectDelete(0,"T5"+IntegerToString(i));
    ObjectDelete(0,"T6"+IntegerToString(i));
  }
}

void DeleteObjectsText()
{
  for (int i=0; i<Historical_Days; i++) 
  {
    ObjectDelete(0,"Text1"+IntegerToString(i));
    ObjectDelete(0,"Text2"+IntegerToString(i));
    ObjectDelete(0,"Text3"+IntegerToString(i));
    ObjectDelete(0,"Text4"+IntegerToString(i));
    ObjectDelete(0,"Text5"+IntegerToString(i));
    ObjectDelete(0,"Text6"+IntegerToString(i));
  }
}

void DrawObjectsLines(datetime dt, string no, string tb, string te)
{
  datetime t1, t2;
  double   p1, p2;
  int      b1, b2;

  t1=StringToTime(TimeToString(dt, TIME_DATE)+" "+tb);
  t2=StringToTime(TimeToString(dt, TIME_DATE)+" "+te);
  b1=iBarShift(_Symbol, PERIOD_CURRENT, t1);
  b2=iBarShift(_Symbol, PERIOD_CURRENT, t2);
  p1=iHigh(_Symbol, PERIOD_CURRENT, iHighest(_Symbol, PERIOD_CURRENT, MODE_HIGH, b1-b2, b2) );
  p2=iLow(_Symbol, PERIOD_CURRENT, iLowest (_Symbol, PERIOD_CURRENT, MODE_LOW , b1-b2, b2) );
  ObjectSetInteger(0, no, OBJPROP_TIME, 0 , t1);
  ObjectSetInteger(0, no, OBJPROP_TIME, 1 , t2);
  ObjectSetDouble(0, no, OBJPROP_PRICE, 0, p1);
  ObjectSetDouble(0, no, OBJPROP_PRICE, 1, p2);
}

void DrawObjectsText(datetime dt, string txt, string tb, string te)
{
  datetime t1, t2;
  double   p1, p2;

  t1=StringToTime(TimeToString(dt, TIME_DATE)+" "+tb);
  t2=StringToTime(TimeToString(dt, TIME_DATE)+" "+te);
  p1=0.9999*ChartGetDouble(0,CHART_PRICE_MAX,0);
  p2=ChartGetDouble(0,CHART_PRICE_MIN,0);
  ObjectSetInteger(0, txt, OBJPROP_TIME, 0 , t1);
  ObjectSetInteger(0, txt, OBJPROP_TIME, 1 , t2);
  ObjectSetDouble(0, txt, OBJPROP_PRICE, 0, p1);
  ObjectSetDouble(0, txt, OBJPROP_PRICE, 1, p2);
}

datetime decDateTradeDay (datetime dt) 
{
  MqlDateTime tm;
  TimeToStruct(dt,tm);

  tm.day--;
  if (tm.day==0) 
  {
    tm.mon--;
    if (tm.mon==0) 
    {
      tm.year--;
      tm.mon=12;
    }
    if (tm.mon==1 || tm.mon==3 || tm.mon==5 || tm.mon==7 || tm.mon==8 || tm.mon==10 || tm.mon==12) tm.day=31;
    if (tm.mon==2) if (MathMod(tm.year, 4)==0) tm.day=29; else tm.day=28;
    if (tm.mon==4 || tm.mon==6 || tm.mon==9 || tm.mon==11) tm.day=30;
  }
  return( StructToTime(tm) );
}

int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
 {
   MqlDateTime tm;
   datetime dt=TimeCurrent(); //CurTime();
   
   for (int i=0; i<Historical_Days; i++) 
   {
      if(Line_1_Visible == true && (TimeCurrent() != StringToTime("00:00") || (TimeCurrent() == StringToTime("00:00") && Line_1_Time == "00:00")))
      {
         DrawObjectsLines(dt, "T1"+IntegerToString(i), Line_1_Time, Line_1_Time);
         DrawObjectsText(dt, "Text1"+IntegerToString(i), Line_1_Time, Line_1_Time);
      }
      if(Line_2_Visible == true && (TimeCurrent() != StringToTime("00:00") || (TimeCurrent() == StringToTime("00:00") && Line_2_Time == "00:00")))
      {
         DrawObjectsLines(dt, "T2"+IntegerToString(i), Line_2_Time, Line_2_Time);
         DrawObjectsText(dt, "Text2"+IntegerToString(i), Line_2_Time, Line_2_Time);
      }
      if(Line_3_Visible == true && (TimeCurrent() != StringToTime("00:00") || (TimeCurrent() == StringToTime("00:00") && Line_3_Time == "00:00")))
      {
         DrawObjectsLines(dt, "T3"+IntegerToString(i), Line_3_Time, Line_3_Time);
         DrawObjectsText(dt, "Text3"+IntegerToString(i), Line_3_Time, Line_3_Time);
      }
      if(Line_4_Visible == true && (TimeCurrent() != StringToTime("00:00") || (TimeCurrent() == StringToTime("00:00") && Line_4_Time == "00:00")))
      {
         DrawObjectsLines(dt, "T4"+IntegerToString(i), Line_4_Time, Line_4_Time);
         DrawObjectsText(dt, "Text4"+IntegerToString(i), Line_4_Time, Line_4_Time);
      }
      if(Line_5_Visible == true && (TimeCurrent() != StringToTime("00:00") || (TimeCurrent() == StringToTime("00:00") && Line_5_Time == "00:00")))
      {
         DrawObjectsLines(dt, "T5"+IntegerToString(i), Line_5_Time, Line_5_Time);
         DrawObjectsText(dt, "Text5"+IntegerToString(i), Line_5_Time, Line_5_Time);
      }
      if(Line_6_Visible == true && (TimeCurrent() != StringToTime("00:00") || (TimeCurrent() == StringToTime("00:00") && Line_6_Time == "00:00")))
      {
         DrawObjectsLines(dt, "T6"+IntegerToString(i), Line_6_Time, Line_6_Time);
         DrawObjectsText(dt, "Text6"+IntegerToString(i), Line_6_Time, Line_6_Time);
      }
      
      do
      {
        dt=decDateTradeDay(dt);
        TimeToStruct(dt,tm);
      }
      while( tm.day_of_week>5 );

   }
   return(rates_total);
}