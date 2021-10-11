unit scroll_;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, MPlayer, ImgList, DBCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Image2: TImage;
    Image1: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Timer2: TTimer;
    MediaPlayer1: TMediaPlayer;
    Timer3: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  kl,UGOL,xf,yf,radius,UGOLS,COLOR,MUZIK:integer;
  sny:ARRAY[1..360] OF REAL;
  csy:ARRAY[1..360] OF REAL;
  HN:ARRAY[1..100]OF INTEGER;

implementation

{$R *.dfm}

const
    HB = 990;  // БШЯНРЮ НАКЮЯРХ БШБНДЮ
              // ЙЮПРХМЙХ МЮ ТНПЛЕ
    HR = 990; // БШЯНРЮ ОКЮЙЮРЮ
    { б ОПНЯРЕИЬЕЛ ЯКСВЮЕ ОКЮЙЮР Б ТЮИКЕ
      ДНКФЕМ АШРЭ ОПНДСАКХПНБЮМ ОН БЕПРХЙЮКХ
      ДБЮ ПЮГЮ.
      бШЯНРЮ ОПНЙПСВХБЮЕЛНИ ЙЮПРХМЙХ
      (АХРНБНЦН НАПЮГЮ Б ТЮИКЕ)
      ДНКФМЮ АШРЭ АНКЭЬЕ ХКХ ПЮБМЮ
      HB+HR.
    }

var
    pic,but1,but2,button,SHARR0,
    SHARR1,SHARR2,SHARR3,SHARR4,
    SHARR5,SHARR6,SHARR7,SHARR8,
    SHARR9,SHARR10:TBitMap;       // ОПНЙПСВХБЮЕЛЮЪ ЙЮПРХМЙЮ
    sRect,dRect,os,us: TRect; // НАКЮЯРЭ ХЯРНВМХЙ
    t,u,X,Y,i,TR,XH,YH,rs,gs,bs,HOMEMUZIK: integer;
    logfont: TLogFont;
    fonth: THandle;
    ENIGMA,SUMMA,mid_numer,n_shar,moves,SHEPH,SPEED_ENIGMA:INTEGER;
    NUMBER_ENIGMA,OCHKI:STRING;

    procedure TForm1.FormCreate(Sender: TObject);
begin
   // жшйк янгдюмхъ яхмсянб х яняхмсянб дкъ сяйнпемхъ
   // сцкнбшу бшвеякемхи бшвеякеммше сцкш гюохяшбючряъ б дбю люяяхбю
     for UGOL := 1 to 360 do begin

    SNY[UGOL]:=  SIN(2*PI*UGOL/360);
    CSY[UGOL]:=  COS(2*PI*UGOL/360);

          end;

   //  люяяхб "HN" опедмюгмювем дкъ нопедекемхъ
   //  рнвей нйпсфмнярх мю 360-РНИ цпюдсямни нйпсфмнярх
   //  дюкее щрх рнвйх асдср нонпни яопюирюл дкъ бшбндю
       HN[1]:=1;
       HN[2]:=32;
       HN[3]:=64;
       HN[4]:=96;
       HN[5]:=129;
       HN[6]:=162;
       HN[7]:=194;
       HN[8]:=227;
       HN[9]:=259;
       HN[10]:=293;
       HN[11]:=325;


   // щрн тнм нм жекхйнбши х опнжедспш яоежшюкэмн дкъ дбхфемхъ
    pic := TBitMap.Create;
    pic.LoadFromFile('DATA/FLORA.bmp');       // ГЮЦПСГХРЭ ЙЮПРХМЙС
    dRect := Bounds(0,0,pic.Width,HB); // ОНКНФЕМХЕ Х ПЮГЛЕП
                                         // НАКЮЯРХ, Б ЙНРНПНИ
                                         // ОПНЙПСВХБЮЕРЯЪ ЙЮПРХМЙЮ
    sRect := Rect(0,0,pic.Width,HB);     // НРНАПЮФЮЕЛЮЪ НАКЮЯРЭ

   //****************************************************

    but1 := TBitmap.Create;
      with but1 do begin
      LoadFromFile('DATA/BUTTONS.bmp');
      Transparent := True;
      TransParentColor := but1.canvas.pixels[50,50];
      Form1.Canvas.Draw(0,0,but1);
      TransparentMode := tmAuto;
      Form1.Canvas.Draw(50,50,but1);
               end;


   // лндекэ дкъ опнгпювмнцн оепхлерпю
      button := TBitmap.Create;
      with button do begin
      LoadFromFile('DATA/button.bmp');
      Transparent := True;
      TransParentColor := button.canvas.pixels[50,50];
      Form1.Canvas.Draw(0,0,button);
      TransparentMode := tmAuto;
      Form1.Canvas.Draw(50,50,button);
         end;

      sharr0 := TBitmap.Create; // янгдюмхе ахрлюою
      with sharr0 do begin      // жшйк бхрлюою
      LoadFromFile('DATA/shar.bmp');
      Transparent := True;      //  опхдюмхе яопюирс опнгпювмнярх
      TransParentColor := sharr0.canvas.pixels[50,50];
      TransparentMode := tmAuto; // юбрнлюрхвеяйне пюяонгмнбюмхе
      // бннаые яопюир асдер опнгпювмшл он йпюъл еякх ецн тнм ю хлеммн
      // жбер тнмю асдер мскебшл гдеяэ хяонкэгсеряъ яопюир я 255 жберюлх
      // х жбер тнмю внпмши мскебни б рюакхже оюкхрп
      // ме гмюч рнвмн мн ъ декюч ябнх яопюирш 255 жбернбшлх
      // онопнасире яопюирш 24ахрнбше лнфер онидср мер бпелемх
         end;

    t:=0;
    radius := 122; // пюдхся нйпсфмнярх хг ьюпнб
    XH:=870;
    YH:=-100;
    SHEPH:=1;
    rs:=70;
    gs:=70;
    bs:=255;
    COLOR:=0;

  // дкъ йнппейрмни пюанрш дбхфсыецн тнмю ярпнвйх мхфе

    image2.Left:=-184;
    image2.top:=-72;
    x:=0;y:=0;
    image2.Canvas.CopyRect(dRect,pic.Canvas,sRect); // НРНАПЮГХРЭ ВЮЯРЭ ЙЮПРХМЙХ
    sRect := Bounds(X,Y,pic.Width,HB);  // ЯКЕДСЧЫХИ ЙЮДП

end;

// ЯХЦМЮК НР РЮИЛЕПЮ
procedure TForm1.Timer1Timer(Sender: TObject);
begin

   // бшвхякемхе йннпдхмюр ахрлюою тнмю мю члюце 2 дкъ дбхфемхъ тнмю
       INC(T);
       if T >= 1 then kl:=0;
       if T >= 120 then kl:=1;
       if T >= 240 then kl:=2;
       if T >= 360 then kl:=3;
       if T >= 480 then
        begin T:=0; image2.Left:=-184; // менаундхлюъ йнппейжшъ
                    image2.top:=-72;
                x:=0;y:=0;
                  end;


       if kl = 0 then BEGIN
         inc(X); INC(Y);
               END;
       if kl = 1 then BEGIN
         DEC(X); INC(Y);
               END;
       if kl = 2 then BEGIN
         DEC(X); DEC(Y);
               END;
       if kl = 3 then BEGIN
         INC(X); DEC(Y);
               END;

  //юмхлюжшъ тнмю бшбнд мю члюце 2
    image2.Canvas.CopyRect(dRect,pic.Canvas,sRect); // НРНАПЮГХРЭ ВЮЯРЭ ЙЮПРХМЙХ
    sRect := Bounds(X,Y,pic.Width,HB);  // ЯКЕДСЧЫХИ ЙЮДП



        image2.Canvas.Draw(240,680,BUT1);

    //  бшбнд яопюирнб 3 пюгю
        image2.Canvas.Draw(290,403,BUTton);
        image2.Canvas.Draw(290,482,BUTton);
        image2.Canvas.Draw(290,563,BUTton);


   // мювюкэмне онкнфемхе х бшбнд йнкэжю тхцсп
     if moves = 0 then IF YH > 520 THEN moves := 2 ELSE INC(YH,2);


      FOR i := 1 TO 11 DO BEGIN  //ндхмюджюрэ яопюирнб б йнкэже

    // дбхфемхе рнвей 11 лмхлшу тхцсп 1 яопюирю он 360 пюглепмни нйпсфмнярх
         HN[i]:=HN[i]+1;
      IF HN[i] = 361 THEN HN[i]:=1;

         UGOLS:=HN[i];

         TR:=ROUND(0.95*radius);

   //  бшвхякемхе у х с рнвей йнкэжю нйпсфмнярх
    xf:= XH + ROUND(TR * SNY[UGOLS]) ;
    yf:= YH - ROUND(TR * CSY[UGOLS]) ;

   // яопюирш бшбндъряъ мю члюце2 рхонл DRAW ахрлюо хлемх "SHARR0"
      image2.CANVAS.Draw(xf,yf,sharr0);
                 END;




  IMAGE2.Canvas.Brush.Style:=bsClear;
  IMAGE2.Canvas.Font.Size:=12;
  IMAGE2.Canvas.Font.Name:='MSSANSSERIF';
  SetTextColor(IMAGE2.canvas.handle, rgb(250, 250, 0));
  SetBKmode(IMAGE2.canvas.handle, transparent);

  OCHKI:=INTTOSTR(SUMMA); // опебпюыемхе вхякю б ярпнйс
  IMAGE2.Canvas.TextOut(340, 300,'нвйх '+OCHKI);


  IMAGE2.Canvas.Brush.Style:=bsClear;  // рхо гюонкмемхъ
  IMAGE2.Canvas.Font.Size:=17;  //   пюглеп ьпхтрю
  IMAGE2.Canvas.Font.Name:='MSSANSSERIF'; //  рхо ьпхтрю
  SetTextColor(IMAGE2.canvas.handle, rgb(250, 250, 0)); // жбер ьпхтрю
  SetBKmode(IMAGE2.canvas.handle, transparent); //  опхдюмхе рейярс опнгпювмнярх

  IMAGE2.Canvas.TextOut(340, 400,'нвйх WQERWQERWEQRWERW ');

    end;

// ЫЕКВНЙ МЮ ЙМНОЙЕ OK
procedure TForm1.Button1Click(Sender: TObject);
begin
    Form1.Close;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var i : integer;
begin

end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
halt;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
HALT;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
  var
      Name_sound_midi : string;

begin


       Name_sound_midi:='data\melodia.mid';

    TIMER2.Interval:= 154000; // гюдюмхе рюилепс дкхммш лсгшйх сгмюк гюпюмее

        with mediaplayer1 do
           begin
      IF MUZIK = 0 THEN BEGIN
      filename:=Name_sound_midi;
            open;
            play;
            END;

      IF MUZIK = 1 THEN BEGIN
          StartPos:=0;  //бнгбпюр мю мювюкн лсгшйх
           play;
            END;
            end;
           MUZIK:=1;   // щрн дкъ окюбмнцн бняопнхгбедемхъ лсгшйх
end;

END.

