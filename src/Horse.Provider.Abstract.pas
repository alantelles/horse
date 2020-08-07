unit Horse.Provider.Abstract;

interface

uses
  System.SysUtils, Horse.Core;

type

  THorseProviderAbstract<T: class> = class(THorseCore)
  private
    class var FOnListen: TProc<T>;
  protected
    class procedure SetOnListen(const Value: TProc<T>); static;
    class function GetOnListen: TProc<T>; static;
    class procedure DoOnListen;
  public
    class procedure Listen; virtual; abstract;
    class procedure StopListen; virtual;
    class property OnListen: TProc<T> read GetOnListen write SetOnListen;
  end;

implementation

uses
  Horse.Constants;

{ THorseProviderAbstract }

class procedure THorseProviderAbstract<T>.DoOnListen;
begin
  if Assigned(FOnListen) then
    FOnListen(GetInstance);
end;

class function THorseProviderAbstract<T>.GetOnListen: TProc<T>;
begin
  Result := FOnListen;
end;

class procedure THorseProviderAbstract<T>.SetOnListen(const Value: TProc<T>);
begin
  FOnListen := Value;
end;

class procedure THorseProviderAbstract<T>.StopListen;
begin
  raise Exception.Create('StopListen not implemented');
end;

end.
