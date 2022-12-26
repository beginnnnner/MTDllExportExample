//+------------------------------------------------------------------+
//|                                  UnmanagedExportsDLLExample1.mq5 |
//|                                      Copyright 2011, Investeo.pl |
//|                                                http:/Investeo.pl |
//+------------------------------------------------------------------+
#property copyright "Copyright 2011, Investeo.pl"
#property link      "http:/Investeo.pl"
#property version   "1.00"

#import "MTDllExportExample.dll"
   void MsgBox(string msg);

   // unmanagedexportsdllexample 1
   int Add(int left,int right);
   int Sub(int left,int right);
   float AddFloat(float left,float right);
   double AddDouble(double left,double right);

   // unmanagedexportsdllexample 2
   int Get1DInt(int &t[],int i,int idx);
   float Get1DFloat(float &t[],int i,int idx);
   double Get1DDouble(double &t[],int i,int idx);

   // unmanagedexportsdllexample 3
   int SetFiboArray(int& t[], int i, int& o[]);

   // unmanagedexportsdllexample 4
   int Set2DArray(int &t[][2],int i);

   // unmanagedexportsdllexample 5
   int ReplaceString(string &str,string a,string b);
#import

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
   Print("● unmanagedexportsdllexample 1");
       for(int i=0; i<3; i++)
       {
          Print(Add(i,666));
          Print(Sub(666,i));
          Print(AddDouble(666.5,i));
          Print(AddFloat(666.5,-i));
       }

   Print("● unmanagedexportsdllexample 2");
       int tab[3];
       tab[0] = 11;
       tab[1] = 22;
       tab[2] = 33;

       float tfloat[3]={0.5,1.0,1.5};
       double tdouble[3]={0.5,1.0,1.5};

       for(int i=0; i<3; i++)
       {
          Print(tab[i]);
          Print(Get1DInt(tab,3,i));
          Print(Get1DFloat(tfloat,3,i));
          Print(Get1DDouble(tdouble,3,i));
       }

   Print("● unmanagedexportsdllexample 3");
        int fibo[10];
        static int o[10];

        for (int i=0; i<4; i++)
            { fibo[i]=i; o[i] = i; }
   
        SetFiboArray(fibo, 6, o);
   
        for (int i=0; i<6; i++)
            Print(IntegerToString(fibo[i])+":"+IntegerToString(o[i]));

   Print("● unmanagedexportsdllexample 4");
       int t2[3][2];

       Set2DArray(t2,6);

       for(int row=0; row<3; row++)
          for(int col=0; col<2; col++)
             Print("t2["+IntegerToString(row)+"]["+IntegerToString(col)+"]="+IntegerToString(t2[row][col]));

   Print("● unmanagedexportsdllexample 5");
       string str="A quick brown fox jumps over the lazy dog";
       string stra = "fox";
       string strb = "cat";

       Print(str);
       Print(ReplaceString(str,stra,strb));
       Print(str);


    MsgBox("MTDllExportExample.dll 成功！");
}
//+------------------------------------------------------------------+
