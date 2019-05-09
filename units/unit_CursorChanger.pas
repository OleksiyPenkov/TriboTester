unit unit_CursorChanger;

interface

uses
  Forms, Vcl.Controls;

type

  ICursorSaver = interface
  end;


  TCursorSaver = class(TInterfacedObject, ICursorSaver)
    private
      FCursor : TCursor;
    public
      constructor Create(ACursor: TCursor = crHourGlass);
      destructor Destroy; override;
    end;

implementation



{ TCursorSaver }

constructor TCursorSaver.Create(ACursor: TCursor);
begin
  FCursor := Screen.Cursor;
  Screen.Cursor := ACursor;
end;

destructor TCursorSaver.Destroy;
begin
  Screen.Cursor := FCursor;
  inherited;
end;

end.
