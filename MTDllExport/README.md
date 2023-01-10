# MTDllExportExample

参考
https://github.com/3F/Examples
https://github.com/3F/DllExport/wiki/Quick-start
https://xn--pckzexbx21r8q9b.net/?page=nobu_tool_hm_dotnet_dllexport

１、Visual Studio で .NET FrameWork DLL を新規作成（ver 4.x）  
２、必ず全保存！  
３、https://3f.github.io/DllExport/releases/latest/manager/ をダウンロードしてソリューションフォルダに配置  
４、DllExport.bat クリックして実行  
５、https://xn--pckzexbx21r8q9b.net/?page=nobu_tool_hm_dotnet_dllexport を参考に namespace を間違わないように実行  
６、Visual Studio で再読み込み  
７、ビルドクリーン、ビルド  
８、bin/86 , 64 にDll が作成される  


配置  
MQL5/Library/MTDllExportExample.dll  
MQL5/Script/MTDllExportExampleScript.mq5  
MQL5/Indicator/MTDllExportExampleIndicator.mq5  

MQL4/Library/MTDllExportExample.dll  
MQL4/Script/MTDllExportExampleScript.mq4  
MQL4/Indicator/MTDllExportExampleIndicator.mq4  

MQL Editor でコンパイルして MT5,MT4 で実行  
