object dmPrinc: TdmPrinc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 444
  Width = 572
  object UIBDataBase: TUIBDataBase
    Params.Strings = (
      'sql_dialect=3'
      'lc_ctype=UTF8'
      'user_name='
      'password=')
    DatabaseName = 'G:\Programmation\MEDIA.KIT\BDth'#232'que 1.0\BD.GDB'
    CharacterSet = csUTF8
    LibraryName = 'fbembed.dll'
    Left = 32
    Top = 16
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    OnMessage = ApplicationEvents1Message
    Left = 136
    Top = 16
  end
  object UIBBackup: TUIBBackup
    LibraryName = 'fbembed.dll'
    Left = 32
    Top = 184
  end
  object UIBRestore: TUIBRestore
    LibraryName = 'fbembed.dll'
    Options = [roReplace, roCreateNewDB]
    FixMetadataCharset = csNONE
    FixDataCharset = csNONE
    Left = 136
    Top = 184
  end
end