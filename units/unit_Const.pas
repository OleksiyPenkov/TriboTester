unit unit_Const;

interface

const

   ReadDataSize = 20;
   PlotSize = 1000 + ReadDataSize;

   MaxFileSizeToShow = 50000000;

  //
  // Предефайненные имен?файлов
  //
  SETTINGS_FILE_NAME = 'config.ini';
  APP_HELP_FILENAME = 'tribo.chm';
  APPDATA_DIR_NAME = 'Tribo';
  Header = 'Pd' + #9 + 'Fn' + #13#10 + 'µm' + #9 + 'gF' + #13#10;
  HeaderScr = 'Length' + #9 + 'Fn' + #9 + 'Ff'+#13#10 + 'µm' + #9 + 'gF'  + #9 + 'gF'+#13#10;

  ForceUnits: array [0..3] of string = ('gF','mN','kgF','N');

implementation

end.
