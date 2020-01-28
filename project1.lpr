program project1;

{$mode objfpc}{$H+}

{ Raspberry Pi 3 Application                                                   }
{  Add your program code below, add additional units to the "uses" section if  }
{  required and create new units by selecting File, New Unit from the menu.    }
{                                                                              }
{  To compile your program select Run, Compile (or Run, Build) from the menu.  }

uses
  ProgramInit,
  GlobalConfig,
  GlobalConst,
  GlobalTypes,
  Platform,
  Threads,
  dos,
  Framebuffer,
  BCM2837,
  SysUtils,
  Classes,
  MMC,
  FileSystem,
  FATFS,
    BCM2710,
  ds1307,
  rtc,
  Ultibo,
  retrokeyboard,
  retromouse,
  DWCOTG,
  retromalina,
  Unit6502,
  HeapManager,
  blitter,
  retro, simpleaudio


  { Add additional units here };

begin

while not DirectoryExists('C:\') do
 begin
 Sleep(100);
 end;

if fileexists('C:\kernel7.img') then begin drive:='C:\'; end
else if fileexists('D:\kernel7.img') then begin drive:='D:\'; end
else if fileexists('E:\kernel7.img') then begin drive:='E:\'; end
else if fileexists('F:\kernel7.img') then begin drive:='F:\'; end;

if fileexists(drive+'\ultibo\Raspbian.u') then
  begin
  if not fileexists(drive+'kernel7_c.img') then RenameFile(drive+'kernel7.img',drive+'kernel7_c.img') else deletefile(pchar(drive+'kernel7.img'));
  RenameFile(drive+'kernel7_l.img',drive+'kernel7.img');
  RenameFile(drive+'config.txt',drive+'config_u.txt');
  RenameFile(drive+'config_l.txt',drive+'config.txt');
  RenameFile(drive+'cmdline.txt',drive+'cmdline.u');
  RenameFile(drive+'cmdline.l',drive+'cmdline.txt');
  end;

initmachine(16);
cls(148);
outtextxyz(100,100,'Initial test',154,4,4);
sleep(10000);

systemrestart(1);
end.

