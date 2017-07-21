unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Beranda1: TMenuItem;
    Materi1: TMenuItem;
    pHTitrasi1: TMenuItem;
    Keluar1: TMenuItem;
    itrasiAsamKuatBasaKuat1: TMenuItem;
    itrasiAsamLemahBasaKuat1: TMenuItem;
    pHTitrasiBasaAsam1: TMenuItem;
    BasaKuatAsamKuat1: TMenuItem;
    BasaLemahAsamKuat1: TMenuItem;
    Image2: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    RichEdit1: TRichEdit;
    Image3: TImage;
    procedure Keluar1Click(Sender: TObject);
    procedure Materi1Click(Sender: TObject);
    procedure itrasiAsamKuatBasaKuat1Click(Sender: TObject);
    procedure itrasiAsamLemahBasaKuat1Click(Sender: TObject);
    procedure BasaKuatAsamKuat1Click(Sender: TObject);
    procedure BasaLemahAsamKuat1Click(Sender: TObject);
    procedure Bantuan1Click(Sender: TObject);
    procedure entangAplikasi1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Beranda1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Ca,Cb,Va,Vb,Cava,Cbvb,cas,cbs,Ka,Kb,vol,pH,pOH,gs,cgs,h,oh:real;
const
  kw=1e-14;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
panel2.Visible:=false;
panel3.Visible:=false;
end;

procedure TForm1.Beranda1Click(Sender: TObject);
begin
panel2.Visible:=false;
panel3.Visible:=false;
end;

procedure TForm1.Keluar1Click(Sender: TObject);
begin
If MessageDlg('Keluar Program?',mtConfirmation,mbOKCancel,0)=mrOK then
Application.Terminate;
end;

procedure TForm1.Materi1Click(Sender: TObject);
begin
panel2.Visible:=true;
panel3.Visible:=false;
richedit1.Lines.LoadFromFile('materi.rtf');
end;

procedure TForm1.itrasiAsamKuatBasaKuat1Click(Sender: TObject);
begin
panel2.Visible:=false;
panel3.Visible:=true;
label1.Visible:=true;
label1.Caption:='TITRASI ASAM KUAT DENGAN BASA KUAT';
label2.Visible:=true;
label2.Caption:='Konsentrasi Asam Kuat (M) =';
label3.Visible:=true;
label3.Caption:='Volume Asam Kuat (mL) =';
label4.Visible:=false;
label5.Visible:=true;
label5.Caption:='Konsentrasi Basa Kuat (M)=';
label6.Visible:=true;
label6.caption:='Volume Basa Kuat yang sudah ditambahkan (mL)=';
edit1.visible:=true;
edit1.Text:='';
edit2.visible:=true;
edit2.Text:='';
edit3.visible:=false;
edit4.visible:=true;
edit4.Text:='';
edit5.visible:=true;
edit5.Text:='';
button1.Visible:=true;
button1.Caption:='pH Titrasi AK-BK';
button2.Visible:=true;
memo1.Visible:=true;
memo1.Clear;
end;

procedure TForm1.itrasiAsamLemahBasaKuat1Click(Sender: TObject);
begin
panel2.Visible:=false;
panel3.Visible:=true;
label1.Visible:=true;
label1.Caption:='TITRASI ASAM LEMAH DENGAN BASA KUAT';
label2.Visible:=true;
label2.Caption:='Konsentrasi Asam Lemah (M) =';
label3.Visible:=true;
label3.Caption:='Volume Asam Lemah (mL) =';
label4.Visible:=true;
Label4.Caption:='Harga Konstanta Asam (Ka) =';
label5.Visible:=true;
label5.Caption:='Konsentrasi Basa Kuat (M)=';
label6.Visible:=true;
label6.caption:='Volume Basa Kuat yang sudah ditambahkan (mL)=';
edit1.visible:=true;
edit1.Text:='';
edit2.visible:=true;
edit2.Text:='';
edit3.visible:=true;
edit3.text:='';
edit4.visible:=true;
edit4.Text:='';
edit5.visible:=true;
edit5.Text:='';
button1.Visible:=true;
button1.Caption:='pH Titrasi AL-BK';
button2.Visible:=true;
memo1.Visible:=true;
memo1.Clear;
end;

procedure TForm1.BasaKuatAsamKuat1Click(Sender: TObject);
begin
panel2.Visible:=false;
panel3.Visible:=true;
label1.Visible:=true;
label1.Caption:='TITRASI BASA KUAT DENGAN ASAM KUAT';
label2.Visible:=true;
label2.Caption:='Konsentrasi Basa Kuat (M) =';
label3.Visible:=true;
label3.Caption:='Volume Basa Kuat (mL) =';
label4.Visible:=false;
label5.Visible:=true;
label5.Caption:='Konsentrasi Asam Kuat (M)=';
label6.Visible:=true;
label6.caption:='Volume Asam Kuat yang sudah ditambahkan (mL)=';
edit1.visible:=true;
edit1.Text:='';
edit2.visible:=true;
edit2.Text:='';
edit3.visible:=false;
edit4.visible:=true;
edit4.Text:='';
edit5.visible:=true;
edit5.Text:='';
button1.Visible:=true;
button1.Caption:='pH Titrasi BK-AK';
button2.Visible:=true;
memo1.Visible:=true;
memo1.Clear;
end;

procedure TForm1.BasaLemahAsamKuat1Click(Sender: TObject);
begin
panel2.Visible:=false;
panel3.Visible:=true;
label1.Visible:=true;
label1.Caption:='TITRASI BASA LEMAH DENGAN ASAM KUAT';
label2.Visible:=true;
label2.Caption:='Konsentrasi Basa Lemah (M) =';
label3.Visible:=true;
label3.Caption:='Volume Basa Lemah (mL) =';
label4.Visible:=true;
Label4.Caption:='Harga Konstanta Basa (Kb) =';
label5.Visible:=true;
label5.Caption:='Konsentrasi Asam Kuat (M)=';
label6.Visible:=true;
label6.caption:='Volume Asam Kuat yang sudah ditambahkan (mL)=';
edit1.visible:=true;
edit1.Text:='';
edit2.visible:=true;
edit2.Text:='';
edit3.visible:=true;
edit3.text:='';
edit4.visible:=true;
edit4.Text:='';
edit5.visible:=true;
edit5.Text:='';
button1.Visible:=true;
button1.Caption:='pH Titrasi BL-AK';
button2.Visible:=true;
memo1.Visible:=true;
memo1.Clear;
end;

procedure TForm1.Bantuan1Click(Sender: TObject);
begin
Form2.showmodal;
end;

procedure TForm1.entangAplikasi1Click(Sender: TObject);
begin
AboutBox.showmodal;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if button1.Caption='pH Titrasi AK-BK' then
  if (edit1.Text='') or (edit2.Text='') or (edit4.Text='') or (edit5.text='') then
  messagedlg('Data belum diisi', mterror,[mbOK],0)else
  begin
  Ca:=strtofloat(edit1.Text);
  Va:=strtofloat(edit2.Text);
  Cb:=strtofloat(edit4.Text);
  Vb:=strtofloat(edit5.Text);
  Cava:=Ca*Va;
  Cbvb:=Cb*Vb;
  Vol:=Va+Vb;
  if (cava>cbvb) then
    begin
      memo1.lines.add('Larutan yang terjadi adalah sisa asam kuat');
        cas:=(cava-cbvb)/vol;
        pH:=-ln(cas)/ln(10);
      memo1.lines.add('pH='+floattostr(pH));
  end else if (cava<cbvb) then
    begin
      memo1.lines.add('Larutan yang terjadi adalah sisa basa kuat');
        cbs:=(cbvb-cava)/vol;
        pOH:=-ln(cas)/ln(10);
        pH:=14-pOH;
      memo1.Lines.Add('pH='+floattostr(pH));
  end else if (cava=cbvb) then
    begin
      memo1.Lines.Add('Larutan yang terjadi adalah garam netral');
      memo1.Lines.Add('pH=7,0');
end;
end else if button1.Caption='pH Titrasi AL-BK' then
  if (edit1.Text='') or (edit2.Text='') or (edit3.Text='') or (edit4.Text='') or (edit5.text='') then
  messagedlg('Data belum diisi', mterror,[mbOK],0) else
  begin
  Ca:=strtofloat(edit1.Text);
  Va:=strtofloat(edit2.Text);
  Ka:=strtofloat(edit3.Text);
  Cb:=strtofloat(edit4.Text);
  Vb:=strtofloat(edit5.Text);
  Cava:=Ca*Va;
  Cbvb:=Cb*Vb;
  Vol:=Va+Vb;
  if (cava>cbvb) then
    begin
      memo1.lines.add('Larutan yang terjadi adalah buffer asam');
        cas:=(cava-cbvb)/vol;
        gs:=(cbvb)/vol;
        h:=Ka*(cas/gs);
        pH:=-ln(h)/ln(10);
      memo1.lines.add('pH='+floattostr(pH));
  end else if (cava<cbvb) then
    begin
      memo1.lines.add('Larutan yang terjadi adalah sisa basa kuat');
        cbs:=(cbvb-cava)/vol;
        pOH:=-ln(cas)/ln(10);
        pH:=14-pOH;
      memo1.Lines.Add('pH='+floattostr(pH));
  end else if (cava=cbvb) then
    begin
      memo1.Lines.Add('Larutan yang terjadi adalah garam terhidrolisis');
        cgs:=(cbvb/vol);
        oh:=sqrt(kw/ka*cgs);
        poh:=-ln(oh)/ln(10);
        pH:=14-pOh;
       memo1.Lines.Add('pH='+floattostr(pH));
  end;
end else if button1.Caption='pH Titrasi BK-AK' then
  if (edit1.Text='') or (edit2.Text='') or (edit4.Text='') or (edit5.text='') then
  messagedlg('Data belum diisi', mterror,[mbOK],0) else
  begin
  Ca:=strtofloat(edit1.Text);
  Va:=strtofloat(edit2.Text);
  Cb:=strtofloat(edit4.Text);
  Vb:=strtofloat(edit5.Text);
  Cava:=Ca*Va;
  Cbvb:=Cb*Vb;
  Vol:=Va+Vb;
  if (cava>cbvb) then
    begin
      memo1.lines.add('Larutan yang terjadi adalah sisa asam kuat');
        cas:=(cava-cbvb)/vol;
        pH:=-ln(cas)/ln(10);
      memo1.lines.add('pH='+floattostr(pH));
  end else if (cava<cbvb) then
    begin
      memo1.lines.add('Larutan yang terjadi adalah sisa basa kuat');
        cbs:=(cbvb-cava)/vol;
        pOH:=-ln(cas)/ln(10);
        pH:=14-pOH;
      memo1.Lines.Add('pH='+floattostr(pH));
  end else if (cava=cbvb) then
    begin
      memo1.Lines.Add('Larutan yang terjadi adalah garam netral');
      memo1.Lines.Add('pH=7,0');
  end;
end else if button1.Caption='pH Titrasi BL-AK' then
  if (edit1.Text='') or (edit2.Text='') or (edit3.Text='') or (edit4.Text='') or (edit5.text='') then
  messagedlg('Data belum diisi', mterror,[mbOK],0) else
  begin
  Cb:=strtofloat(edit1.Text);
  Vb:=strtofloat(edit2.Text);
  Kb:=strtofloat(edit3.Text);
  Ca:=strtofloat(edit4.Text);
  Va:=strtofloat(edit5.Text);
  Cava:=Ca*Va;
  Cbvb:=Cb*Vb;
  Vol:=Va+Vb;
  if (cbvb>cava) then
    begin
      memo1.lines.add('Larutan yang terjadi adalah buffer basa');
        cbs:=(cbvb-cava)/vol;
        gs:=(cava)/vol;
        oh:=Kb*(cbs/gs);
        poH:=-ln(h)/ln(10);
        pH:=14-pOH;
      memo1.lines.add('pH='+floattostr(pH));
  end else if (cbvb<cava) then
    begin
      memo1.lines.add('Larutan yang terjadi adalah sisa asam kuat');
        cas:=(cava-cbvb)/vol;
        pH:=-ln(cas)/ln(10);
      memo1.Lines.Add('pH='+floattostr(pH));
  end else if (cbvb=cava) then
    begin
      memo1.Lines.Add('Larutan yang terjadi adalah garam terhidrolisis');
        cgs:=(cava/vol);
        h:=sqrt(kw/kb*cgs);
        ph:=-ln(h)/ln(10);
       memo1.Lines.Add('pH='+floattostr(pH));
  end;
  end;
  end;

procedure TForm1.Button2Click(Sender: TObject);
begin
edit1.Text:='';
edit2.Text:='';
edit3.Text:='';
edit4.Text:='';
edit5.Text:='';
memo1.Lines.Clear;
end;

end.
