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
  object ShareImageList: TPngImageList
    ColorDepth = cd32Bit
    PngImages = <
      item
        Background = clWindow
        Name = 'PngImage0'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000002D34944415478DA
          75936D4C8D6118C77FCFE9A8A694A293B25A796991A926D634CBB4354B19A9B4
          65312A0AF332C5E8438D696B28F35209CBDBE43569464BCDD48692E985663E64
          6B48E7902F56A78EF3B89E5368C9F3EC7F6FF7755FFFFFF572DF97C2F8CF0337
          59E3056182C5023BC1CB51DCC528FF984F19478EB35329DBE68257E252F03681
          A3077C7282860EC87B876948214B246EFD2BE0C189603D7B6E86428083EC5B05
          0363C41742B70E92DBA1D94AA98864FE1590C8012AF7B51C0F4FD6D13C751A39
          5F4DC40CA9B6E356BDC2C9454B18FAF09E3C533F291695570A495A268A90DD75
          2A6F9A60C603471DA1676F121B1D4B7A66326BEBAAF1B7C285D875149DB98EF1
          AB91FDCB6693D33FC0226CE5CCD7043626A954DC905CA23C5CB9F7A28729CE53
          B0582C6CDFBD098761332784ACD7EB69EB6CA36AFD72F28CDFD92AC99D53D8A6
          099C3A0E3BF64AAAF593148A82C3B87CED11EE6EEE58AD561B347267572725C9
          2B38FDC98822C12E8AFF1638AF093C7B02E191A3BD6A917AF3E72DE0C2F53A3C
          0D9E365BEF975EB26242A9ECE9C57ED4AF4D32085178AD0934D543C48AD1838F
          760A99FEFE945535E1E5E9F5E71272F3B309387F9C54F348635F09A40FAD9A40
          71A1CAAE6C49CB24D794E63393E23B4DF8F9FA61369BE933F5E133D3C746CA2B
          388477490119832AE5B2CF80524D20650D5CAD12C366832B3955CF099C1B686B
          625A4622FD1D2D1CBD524B5060904D24362192DB8D4FC994442A249E26E0A2A8
          743C56F06D749AC486862E66F9CD62EBCE5456565F234ADE42BAC19D7D971EE2
          ECE44C6E7C0407E516C2553EFF5408FAFD90A2FDA0B645548F4D77A13B288455
          CD8DA40E8ED4FB43BC729CEDD10D0FB35D6CEBC4FC5661B53CA49AB14FB9608E
          CA8123663058047A7090539DE08BEC3F0E8B90F4A870B290ED2812F2DE898629
          5ACA294FB0E21B2A7360109370E893A55DE6A35247AF5591DE49E489A77144C4
          45D6B8FF8C738D90BF8D75FF056446F676B83D16C00000000049454E44AE4260
          82}
      end
      item
        Background = clWindow
        Name = 'PngImage2'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000002AD4944415478DA
          6364C00302B4546C6EBD7977FBDAAB772F71A961C46740A4B1DA99571F7E9CD8
          7BF7510EC906046AABD84527E91DFC70E7D1CFDE35F794AEBF7EF78C2403C28C
          D50E4D5E1465FB79FB2686F4196FA6EDBDF3289B68038275548D5D03E4CEC466
          8530BC9EDEC7B0F72DFFCF9ED5D85DC10854CC05A4D5FEFFFFAFF9F7FF7F5D6E
          1E567D29396EF39C1A4361092977861793AB18FE080B30CC39C9F0EAF5F3EFD7
          5FBDFC760D68EB6D6626A69B4C8C8C9719DD55E56BD5E4791B53D27518853424
          19F804FE00CDFB0F369D932790E1595F0683705416038BA810C3BFBF9F197EBC
          7BCEF0E2C27586F6BEAB9FCE3E789D09F202939DA274639AAF44B59D2C0B23B7
          BE29039B9C02038BB0040333AB04C39BCD6D0C5C16860C3F6FDD64F875F705C3
          9F8FDF18965C64FDB6E8C0C3BCDB6F3E2C858501A38D825475828744938BC457
          4686BFFF1818D9D91838AC5D18FE7DBDCDF0FBDA13867F9FBF3330B0B2302CB9
          CCFA6DE1BE4779B7DF7E580AD4F703391019ADE4A48A5283E57A7C02651878D4
          BD19CECD5DC8A020CAC0C0EB6EC4F0E7DD5B868553AEFE9EB6FE4E2650F332A0
          FAEF18B1E0AFA52C6AEF26F32AA5C494E1C1FEF70C6F8FEF6150146663E073F5
          626056626698D17EEA4FC3CC138ADFFFFC7982351A4189272C51EDA09DAD01C3
          F545CB195444D8C0E2C01862104BC8673874E8124345E53AF78BCF5FEFC26A80
          9FA6525E5993CD44F6EB37199899FF302CD8FBEDF53F86FFCC714E3C42927C1C
          0C4CCE690CE15E15E5471E3EEBC26A80AFA6D2ACDC78C5D4E3A75F7DDD79E6ED
          A2B34F5F2E6063667AAF2F299663A9C69BE0E1ADC1D736E9DC1260DE88C565C0
          F64F3F7EBD3DFFECD5FC4F3F7F9D050A7D804A310970B0ABE949881470B0B228
          EDBAFDD00328F60FC300612E0E9DB7DF7EBC01325FE0C822CC4017A9FEFAFBEF
          1190FD0D24000040570B93372DEC9D0000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage1'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000002294944415478DA
          A592CD6B136110C6E7DD4D77934DB22135B64131F6E04141A9600B6A4AA14A2D
          484185D093D263A127F1E43F50025E8A2785A242FC041551A9D683485510AA96
          A295A2398828B40924DD669B4DB29BDDD767575B62B162756118769EF93D30F3
          0EA3FFFCD8BF40E12E793B521FE2DA860D00B7234D0A011671AAFCFC860C00B7
          224D35C5C444F48842F95BFA95BF36002C233D6B6A150FB4A442A43DAF50F9BD
          99643FC583488710AFF597B527EB186484203B153FA9527DD9A1FC75FD2D7A3B
          1884E3829FDDF1B7F9C4EAD77AD629F39D109C35F0591229DD321026292E52EE
          864E56CE1E445FC63578181F54FB3117E93355D29E565210EE36C0C790EE6166
          16DA2393366990FEA6368F5A1BFA4CA6F6C8D9B1CB633B964C8D466747682153
          7AB778BFD20ED01DEF0C6224B45796A3871532B226151E945DDF7EC0E3DE1DA0
          F17672B83315DBDA4CD3C5292A7FA85171C23807AD13D113DC2D51B45721BBE4
          D0C2559DB8C92F001E5E3D24189C567649A39B8E06BD027738CD5F2A794024E9
          27757F80789D53EE26E6CEDB7368E98081D16890C082B25B8622921810BCA255
          B03D2369B3CFCB85F132553E59DF207501FED2B8E09567BC18E90E0C85F7F989
          FDF000E8AA9C8A8F0D32E6CC3CFEBA017F5CFBBC2B06DBF094B3B181A08A193D
          41C00E97A74DF75834771780677E771FAB9708933E39E17BD4DCAB08DCE2A4BD
          A852F5B395837402F0ABF52EF4975376DF5C0CB3B46D70936C9A40290D78E94F
          27FE1D8907E6C663A07E000000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage3'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000002C74944415478DA
          85935948546114C7FFDF5D67C671C69CCA254B3431431353B3CD368B32840A0A
          4A92821482227A880A22B21E2A7AECA16244212525B017A1F0A1E5C12CA990AC
          302D2A0A97D47146C671C6B977EED2B1B4C620BBF0E7C077CEF971EE5918E6F8
          628B6527993AD252D21DD2F540BBA245C7B0FF00EA04277764FE6E3B025D0A82
          EFD54E686605417AFF09A02481CC16D27A5275EC2A1967ABCEC1A30CA3B9BB11
          DEFB1313CA805E4690B659004A94C89CE62CEC5841595E72C415C6983C0A43FA
          5571923505F1B20BEF86BBE0B91750D521BD8420CFA2012D4BB25376ED3CBC03
          9D631D18F0F4430F1B30551372A20826FE29561DD3307CDBFF32D01659CDA693
          8B39993D3D73ED14EABB6BA0782330C64D04DFAA13622267771459213878E841
          03E17E95DE2350FBF49B54C1F1194065C24A576D46692A7A7B7BE0EF500C6DC8
          A822571344F39B6B4F4C024C133A417D8F43A623DFC282BD11980173EB0C60FF
          9235C9778D7521043FD0BFB7864760E024B91CA4EDB66C71AFF25DEFD67DC613
          5B9670C29A2382A75E8F3406EA67000ECECE3CA28B9754AF86984C09423C07CE
          CA1078A51A91213D9FCA7D4371A5318562AB7D8505BC8DC3E00D7FC76F009331
          10B7CD6AE7ED0C9C85032F31188A09FFF330C29FB434027CA5B80B8E4DF2255B
          86041132FAEA46DB6700B290C08D275538A5E89D507D1AC61E85A61AD662F2C6
          225BA654605B2E3279A18474230BED352F1E448FB169C13E7BF9E26529F08487
          A7C71581364EA3D4CC9F1BC35B18952EA03CF710DC576B111A0A1F8D06A4C9A9
          C2C7F403C9C2C1F44A347C7663529F04CF7858782B122C498893E39163CB43BD
          BB01FD3D83AF296DC3AC5526C8C5B8126B75DEC65C14BAD6C2DD700B9A4F8714
          27C2617762E48B17CA60C4071DCD147E9EFA32FA37803399F970DE665B09AD34
          BCAD41AA9CD592EB0A69EA32FB28C93BE73512249E8C9B5444AAA184CB735DEC
          0F785825E091F805B30000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage4'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000000E14944415478DA
          ED92C10A015114867F0B1B6535240B294BB1E4156CAC2D949447E011587A0D36
          965EC2DAC64693264964A464DC3B7367FC33A2296CD8506EFD7D9D3AE7BB9DDB
          8DE0C313F90BEE8228E330DE5B826A2E37AD148B2929A592E7B3630BE1089251
          6B5DB748DB0514EDCAA762B69C9D00B54030E87456F57E3FAD8E479C663388E5
          12AE94F098ED6804733C7EB87941491328078276366BD4808C300C2EF17A0B2F
          C43DD3022A81A00B6C4A4032DCF46C305C9B7CB306900F0405609820B99F7B0B
          9BDCB8A6C5CCDDEEE0D7EABABF4F02B604AC39D0FB9E7FF0C3820B346C6CD8A6
          11B6770000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage5'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000002884944415478DA
          63644003B67EE9D1402A06881F00F10E20DE7B78D3CC2F0C3800239A66010E76
          B6A79D0D455CDF7F33323C7BFA98E1F4D90B7FCE5CB87EE8F79FBF9B814AB602
          0DBB8DCF80E2D0609F1E4D035B863F7FFF33FCFDC7C0C0C9C6C8C0CDFA8FE1D9
          E3BB0C274E9C64387DFEDAFD3F7FFF6E022AEF031AF688114933130B33F3BDFE
          EE26F99FFFD819FEFC031900C47F19C034C8407636260611EEFF0C7B766D6758
          B67AF3A2D37B9625201BE0EFED6AB321302818A818A2098291D9FF1978395918
          CE1CDBCBD03B61CA94EBA77715C20DB0F34BDF376F7293232B173FC33FA0A67F
          FF219AFF8134FE8718021297126265A86CE86658BF7C56E8BB170FD730426D97
          32D0517BD25A93CFF8E3F73FB801403D6003FE810D60606002AAE664FECE1010
          5378EFC48E057E40AD57610664E7A7474C7177B2052B06EA052B6606122CCC40
          0CA49998202EDDB2FB08434D53EFCA8B4736E400B96F2006F8A6ED5B33AFD391
          9F9F0FAE0917A86E9FC1B064C19CA247B7CE4E0472FF31026D17D652537835BD
          AB820914A9B8B53230FCFEFD87C12BAAE0F3BE75335CFFFDFB7B129C0E800624
          65C407CD8D0A726320044E5FB8C69059DCB4FFECBE950940EE23B00136BE69CB
          E6F45747AA2BCB113460E2EC950CD3A6CFECBE757E7F1D90FB036C809577F274
          2B53FD0C577B33067515790659293160803161352022ADE6EFB6D5B3FC3F7F78
          BD159E94D58D9CB89959D89A39B878B5D838B8547879F914D494E598412E0219
          086433C8498B335CBA769721A3B8F9CAC95D8B4381FA6EA0E705362016026201
          764E6E11311935435E41314D4E6E7E5590A13C3CBC727FFFFEF97DFFE685B6FB
          578F4F06AA7B8F3533A1014E908120CCC1CD27C6C4C8CCFFEDCBFB3B40FE3564
          4500A8381425511C237A0000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage6'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000002544944415478DA
          A5934B48546114C77FF7CEDB2B3A53BBA224280C4C372D1A30894C21ED21448B
          16652A3D7424CD6913525154DA10154850985418418B8A52D42022455B94F620
          CDE801D1A607C9306ACEDCB9F7CE4CDF0CE320392EA2B3BBF79CFFEF7CE7FB9F
          4FE23F439AFB910B4B6450DEC3A774C56B213B0AD6D7F06B1E201FAACA6DB44F
          C7900735768EC283B962915F5D6465C825E3EC52392CF297538078E7ED36BEB6
          B8F3CCC1462FAD557546CF9456218A7A93E2FCAD8A69F0689B2FDBD1D3CD89DE
          8168B74AFE3B184F010A2D7CBCEA44D19A8F63ACCAE5ECAE6ABDEFB7BE4514F8
          776459FABD37AE6422CB28F507A99FD063431A6E0178911A210FD697D8787C21
          0B7BA8C547D4B5885395B5DA628B1CA9BFD5E190D5308E460F47FC46EC499803
          42DC31EF1205A4B8CCC6235FB66499B9D4464C1269A70B693280BDA901AF3F12
          7DAA512DC49D695D48CE5BB6CD4ED719A7C91C3C76122914C27CFE1C4D816864
          4063B710DF59D0C678AC81D26A073DDE4C2C8130C8A2C266818629D4671A1BE2
          732F0810DDCBF767F0F09082F9674898AD8A9F3158AA80C30A9E49A647740A85
          3BA3E9F6A0C293C1BD5A05D3ACF822A80566AC253AF2B24C305B1210FFB08E7B
          76D912800228AA53E8AFCD40FE11848970421C1C3628150758EEB173BB484072
          044412909A00DFBF18E4BC045D4ADEFEE6EB4EFA564420DEDD0733AF0C368DC3
          F364BEB2D1CECD753AD2CA2C381D247A378CEB334CA546A830D1B9D7C19EFB2A
          D36F0C8AC760E42F8BF7D5D869774848D742B48AF7D09C6E0F369AE0DB5BF890
          EE3115244C02911F5BD0C67F8D3F6BFCCC1133F3D5EF0000000049454E44AE42
          6082}
      end
      item
        Background = clWindow
        Name = 'PngImage7'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000001FA4944415478DA
          9593CF6BD44014C75F12936CB6D952B65B518A05517BF0B058F1D2837AEA45D4
          6E0F8242AD070F22F807789122281E05BD143D78125A5A8A87B5875651885A0F
          D28BBAA058AA4584FE706B379B6C26999DF84D9B951E76250D7C7930F3DE27EF
          FB6646A2FF7C9993BA82A0D916ABB5CA915A6D98A7B4FB99DEF4151172ADB6E8
          4F545EFB571303F067C938AC5626EF3D33AFCF0FD3EF19A7BCF2D8EEDC0D4049
          1FD5FECCDC9D332F5B8508B00940C76E00AA99D7378AB767DBB600CF1DDBFDE2
          776016A2290005598441288845E671FD49F1D6AC1101D68B8E5BFBEA9FC13283
          385487BE01683700633DFDDDD7DA3B331486824418D29E2E891E141ED1883544
          CE6746C17A1D7B48460F21106EC97B190A69600B901D321646EF8CF6F5980749
          966492A3D610DFAF5A34BD3CDEF494CA73AE703EB2133120BDB06FA4BDAF5922
          B7EB146CF0D8AF44616CDC5BE2A2FA81E51B161E1ABDEA0D3925FF2BD4F72AD4
          96D789AD70E25541EC87BF5D191120A714BCB05F79030D808950D831A02C8063
          B9B326F9AB01D59602AABC6537B13E1FB163BDC310CBAD8EF18071445DCE9D33
          8901807601F02EA0602AE93DE8C64DFC993B0FC05A40EC3BA74DCBBB04C07852
          C0FED421F557D7202CAC4516D0C11B6F1880A74901780C349D39963A4D0A296E
          C9FFC4CBE222008B89003B401A6D3FE76AAB9CBF3CDAE1617048617400000000
          49454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage8'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000001034944415478DA
          6364A010308E1A0037801588FF00F17FB20CD0F254BF64E26228FEF3D7CFBF3F
          7FFEF8F3F3F7AF3F3F40F4AF1F7F1F3EBBFFFDFBCF1FBF19FE31FCFDFF9FE12F
          C3BFFF7FFF03D97FDEFE63FC72F66718D880BA0595CF1AE3DB24BFFEF9CA70EF
          F32D8697DF9F33FCFEF71B887F31EC7CB699E1C08BDD18367FBDF9F3EFC38AF7
          6660030CB3341F09F971CB3EFFFE04AF73FF039D0074090388FAF1F017C3E3A6
          8FEE60032472F85E716BB18A8282E0FF7F46B00AA033A1BAA01AFF23FC0C62FE
          FBFAFFCFA39A0F5A600338355897B10831814C0743A07A302DC427C4F5F6DDDB
          8FFFFF8143E0EF7FA83C50CBEFFFBFFF7FFF71FF4FCBE0490743D80000DB0F93
          DB1F8FF0470000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage9'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000003224944415478DA
          7D930B48536114C7FF5BE673DB2D0DCD1EA6919A5A269951E1B02C62858A2492
          81E4921E4866216AD94BD3DE112114562624A168896669619A269AB458669996
          92F391AF1E9A39F772BBB37357AB0CEAE3FE39DF85FFF99DEFDE733E1EFEB1C4
          617B180AF34873FF8AF6A4ACFA7BD71A381FEFA739904214BD78CD75767475B0
          67E60805B6D68C480821C340281090EC20B4B38542D1895B771E3610406C0250
          F22A1B6BABA7871262F8AE0BDDA1612DA0D6B150698DD0E88C3018274D625992
          1108F69E8E2DD21415E50A0932C90136FB78BA552425EE8752C3827C30FE4C30
          707BF607801E18682FF61621724712C6556A37027473800DC181FE55D298EDD0
          93C1944C6696E2D79111C81AEB30CDC212BECB57C346C0C067BE0D524F5C446B
          7B5708012A384050D09AE54F12E27640A7E72A4D62F8CB30CE6624C1CB6D08CB
          56AE80726C14358F5E60C66C09CE64A6212BA7100FAA1B5308708103AC0EF0F3
          6A4C3F140F1D9D79922AEF8A09C5917409948E3BC1F204A6AE584E74A1A5F21C
          14EF6C11209620FB66491E01A41CC0DFDBC34D9E753A191304282D2906AB2D87
          CBA65C187996BFDAFA4DA94649791DD8862484446620A7B04A4E80000EE0EEEC
          34ABA3E06AA6E91FA4A71D4354EC527CB68B9A3217439F469157FC0462FB5A30
          FC4528A96935758203584EE3F33555772EF3C1E321253911D284207CB40A9F02
          68EF1CC4DD4A19829C9E8331CE46595D07F406C342F320F5145E3FE9E2EC380B
          F905F960447258FB5FA429E1FF3A7E7E693DD41A2D5CFACE21467A1E376ED740
          D133106206D45ECA3CB0D6DF7731944A25B66D0DC6992BA9907F15A3F94D2FDE
          2906682E0C38AE2A83B6B316A2D422DCAF6D46FDB3E68366406EF2DEE8D8D08D
          81A68A32990CC78FC6213C7A3D46AD57C2A0D781FD508DE461156C574C20E371
          3FDA8CEB30F8459962061C8E8E909CDABDFDF777ABD56A646767A3E9E52BD360
          D9891CF0B6AD053947FDB058DD8D3569F28F560B249E66C02A8799A2C6386904
          EFDBD8383A7BFAF1BEAB0FDDBD03EC84DED04196D7A4575C94D7147964EE5B92
          585AF9B6EC69D3703CEF8FEB1B4B218CD46D36935AA9D75AFC677D075B1D7633
          3CBB566F0000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage10'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000001F34944415478DA
          6364200DB000B12610DF00E2DF2001465274B3B3B0AC48F1F70F5FB275EBEB8F
          3F7ED8810C22C58088B91515CB1DACAD190EAD58C190B474E9C6FF4031620D90
          0E7596BAE969A6CCFDFD9E008386BC2643FCE4C9679F7CFF1E4F8C018C4A92AC
          07AE1E5D64C7F1693FC3C1038719A674BCFBBFE6C5CB7CA0DC698206B03031E4
          9D5A1632D1D0D48681E1FE148643B71419ECB3766F024A4D07E26B840CB06948
          9438505FDFC4CC70A78BE10383368353DACE4FE7EFFD4804CA3D07E213F80C50
          B0D5E538BF7F759D00F3F3950C0CFFFF30F4AEFAC75032E37A3B50EE20101F07
          E24FB80CE015E6633A71FB60BB96E0AF130C0C9F2F335C78A6C16092B0E5F4DF
          7F0C7540F9070C90B480351D3001F186D31B8A7C4D7464804AA731DCFFA8C0E0
          5B70F8EDD5C73FB38072AF80F80810FFC16540A183B144DF9605790CDC2F1730
          3C7CF98BC1A7E6CDEF2BF7BF1400E5EE02F129207E0F8F2234CDFCCA8AD20FF7
          6D9ACEBF6BCB06064FC57D0CBEB5EF3F9DBFFDB10128771D8A1FA2C4315A94B7
          FB47A65424398A303C7BF284A16DC6CADB8F5FFD6A044ABC01E2DB407C0F2391
          20B1A555F5EDEFCBAAE8B37E797CF2DEA95327E700C5CE334032CD25207E8D35
          952131A70A49C86BBC7BF1600D90731F144540FC18889F01F15F5C718DEC0259
          20168106D05B20FECC40040000DF7FB49BA1F383500000000049454E44AE4260
          82}
      end
      item
        Background = clWindow
        Name = 'PngImage11'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000003034944415478DA
          85936948545114C7FFEF8DBE992C9B72346953332915353010D36C7761FC206A
          64588659661B49591FB45248A522B305120D97148D408240D2A45CB3A4D2C605
          2BC771DCC61475741697D9A7EB94D3541FBA70EE7D9CF73F3FCE722F85BF567C
          7C7C908383430287C371934824391B4B4A5A89DB999813B1F73780314B3DB5B8
          A5031C728410F39AD819703830E98C374551908845D077D4C24933002B8AC1A7
          AAE18E5C2092E806CD00124C9353B03DD6C547C85D0FC623162C2B1616545A18
          8C14E4732A58B35762402480DDB342CD7DA5964FF475960096159BA55B71290C
          FA0DB1F0F50B008F670F8D1E506B8DD0E80CB061D378FEB4106B27FBD0D8D43C
          5AD5D3B3588EC15C42E6722BBD3C218A8E4C7A048D91014559D44736B6358DC6
          9213D8B5598AC7195FD44F46C73CC91FB159936D6BAD9A4D8C62C79CCD838E62
          835A4AEFD7476B75018EEF033ED4E4223165B459041C25EE1133E0269751A892
          A26DE392F3A107630E6691EEF475BD83C7CA6E382A8A109E2605BB6DACAE1A48
          20926133E0368F2DD59F8EB63B965C0023CD989C1C86C2DCCC385A2AAF206687
          0C698513E81EB1C59A37CDEDA5401C917CFDDD030EABDF3EE3906B48EC3D7057
          F3B08CA14D8D4BBE701E077CEDD0DA528DD0B8BB282E2B877571E1F722208284
          B559DE8306CFDC837B36EDCD84B7E716134020E840CAB55B080BDA86307E38DC
          DDDD91929E03C3C30C6DC1822E940CA9C11250E67F871F67F049033F38D054BF
          5C2E8746A32123E581A669535F52B3F3A02EBE8E57E2E978927FA925206B7FD6
          EEAB42978B387924C27C4D753A3DFA8746F1AD6F10BDA22174B637C14DF0022D
          9DD2D47AE001912C2C0192822FFBE65718C2C10F098668500251BF188A29111C
          6C9470B657C3114A7026A7D05D2ED4552AB4E7BA810A123AB70408F38D72ADF1
          3AE587FA0E35B83A396C64D3981F50604628C3B850AE52AAF56225201A00DEBE
          065EFE310502608C34D5B36EEB2AB7A99159B56C562B9E256229D04B9EDEE78F
          40971698265239B1F97F5EE312A413F0AF0566543FC5B2C514F19FF503E35E2A
          204B08058E0000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage12'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000003604944415478DA
          6D537F6C535514FEEE7BFDF1FACBAD5B07ED5A2863EB3612602CB18B46171323
          9943428C1223930C220A26265333FD47130D31C699A09300662E189C193131F8
          63401490B0C505C600C5CD76736B29DD5CC72CA5EB3ADA3DFBFADEF3BCC61045
          4EF2E5E4DE9CF39D73BF7B0EC33DACB6F1E915E4FC843A4294709930FEFBE0D7
          F2DDB1ECAEC46A723D8407B4B30A9681AA981999AA28F1BC24BE7CEDD20FC7EE
          4940C9ADAAAA76398A8DAC65E746355BF58C7183D3C299988C6BB337B3C70E77
          A742A3A3E5F99CF855EA46645B627A5CB94340C96BC9FDB2F9C152DDBBAD6E26
          783662545D0796071C46154BCC060307EC3F31143F71705F99B898FC786A64A0
          5D6B9251B28E2A0F5738850D7DEFACE20CB695504AD7E3C7C53AD4F131945919
          7E16AB709F0E05923D7B0F86FFB8D8BF223933D97C331AE8D7081A89E9A79ED7
          BD68A831432DAEC597E226DCCF4DC1674A01A6629C595C0F0BCFC1A607CEDD90
          F0E94B2D8B4B0B89E3D32303BB358257F43CFBE8D227F59C8102BE655B3034EF
          4387FB34789E07138AF14DDA0F8E1960A32EA219E0C3F6B689DC6C384D826E65
          350F3F75C4E7B66C5FF3DCABBA8E9AEF71DBEE455BE45994A839D4B3592C33AB
          98142AE114647A868AAB2986DE035D63D268FFF2C9F3DF3DCAAA1F7AB253108C
          2F18DFE8B50E79DFA7AA32AEE81BF05E6C138AA8A306FB3C76BB7E852E478A6A
          BA2F05D17E282C9D1C9C894E5EE8DBA975D042DF7C54683F82A3F62FB066F91C
          92B62A34057714DEBCDD1DC12EC359D29B0872B7C8E7B065EF941C0CC54F45AE
          9C7E4BD3A0827E21CCFB9BE3D6A61DCE2EA107E3561FF6251F29CC87C320E28C
          B71381693B248543787A5E79FBF065359D9839303B3EBCBF300795FEC7BB7582
          E579E3AE0F24BEBC5230CB22B2BC5020F09832E82BEF446B701B02BC0762E78B
          734A369D085D3CF9A6AAC8030502578DDF622D71FDC6E90D4EFD137BB2FAFAC7
          4AB5FB6AF32D7CBEB2174236819EA047E9E81E8EAB9905FB9FE1ABAFA5E6AE0F
          68FB716794CB2AD6F96C0EF76706C1D28822478CF7AECD35572B2E8F183206AE
          67717E6C4195657922110D1E4AC642014A192428FF5926B2A2F2DA863693ADA4
          893708AB398E77913EF34A5E9AF82B9B1E99095E38A5C85284E2C608F9FF6DE3
          3F46038B558452BD6059268919EDEE3681C6123142E2DFC17F03DFC55B0C5750
          2E1C0000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = 'PngImage13'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C0864880000001974455874536F6674776172
          65007777772E696E6B73636170652E6F72679BEE3C1A000001DA4944415478DA
          6364A010300E5E03786DD8453E1FF9F9A68E81818F5B88BDFFFF7F067786FFFF
          399958989EFDFCF2BBA1F6C7DFB5580D006AE40052490C4CFFA7B0FE66589273
          83C1D12F574F4CD7579B8D4DD281E1D77F6986EDA5AD5F6EEE3AB1B0FCDDCF1C
          46A0063EA0868DFF19FEAB3032303203D9A28CAC0C2C22013C0CB27F94181EEE
          BCCEB03CDD9CC14259186203972AC37FB95C8625EEF6EFEF1CBCE9033220934D
          92799A5682128322A71A8330BB08C3A5CFE7189E7F7FC2E02313C470F3CE4D86
          63B38F32AC4CB36070D410831822ECC6F0F2EE5786854165B34106D471EBB235
          F259015DCE04F411E37FA0BF18199839406C460626207C7FF40B83EA734E86FD
          A5F6F0A0FBF0458D61B67FF7299001A16C52CCAB788CD9181859819AFE338031
          0B3F13103333FCF9F097E1E3BEEF0C2BFCCD189C34C5E06175F3D06B860D7547
          67800C9004F28B81581388D941BE6460FB6F29ECCDC50072CBCF7B7F189AD435
          1852ED14E19AFFFDFBCF303D6CD7BB57773EBA638B0550405EE7D26251FDF9FC
          EF3FCB1BFF3E56796B70EAFBC873700B7130BCBEFB91617DDDE98F9F5F7D9F59
          F6F64739D6740034C412481501F1ACC2233F8F7009B035313133F9FEFDF34F90
          859DF9D6D7773F9A1AFEFCDF3DC89332DD0C0000ABAF9A5A98B2834300000000
          49454E44AE426082}
      end>
    PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
    Left = 312
    Top = 16
    Bitmap = {}
  end
end