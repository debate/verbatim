FasdUAS 1.101.10   ��   ��    k             l     ��  ��    $  Verbatim Scripts for Mac Word     � 	 	 <   V e r b a t i m   S c r i p t s   f o r   M a c   W o r d   
  
 l     ��  ��    #  Copyright � 2023 Aaron Hardy     �   :   C o p y r i g h t   �   2 0 2 3   A a r o n   H a r d y      l     ��  ��    "  https://paperlessdebate.com     �   8   h t t p s : / / p a p e r l e s s d e b a t e . c o m      l     ��  ��    "  support@paperlessdebate.com     �   8   s u p p o r t @ p a p e r l e s s d e b a t e . c o m      x     �� ����    4    �� 
�� 
frmk  m       �    F o u n d a t i o n��         x    �� !����   ! 2   ��
�� 
osax��      " # " l     ��������  ��  ��   #  $ % $ i     & ' & I      �� (����  0 runshellscript RunShellScript (  )�� ) o      ���� 0 scripttorun ScriptToRun��  ��   ' I    �� *��
�� .sysoexecTEXT���     TEXT * o     ���� 0 scripttorun ScriptToRun��   %  + , + l     ��������  ��  ��   ,  - . - i     / 0 / I      �� 1���� 0 
openfolder 
OpenFolder 1  2�� 2 o      ���� 0 
folderpath 
FolderPath��  ��   0 I    	�� 3��
�� .sysoexecTEXT���     TEXT 3 b      4 5 4 b      6 7 6 m      8 8 � 9 9  o p e n   ' 7 o    ���� 0 
folderpath 
FolderPath 5 m     : : � ; ;  '��   .  < = < l     ��������  ��  ��   =  > ? > i    " @ A @ I      �������� *0 getfolderfromdialog GetFolderFromDialog��  ��   A L      B B c      C D C n      E F E 1    ��
�� 
psxp F l     G���� G I    ���� H
�� .sysostflalis    ��� null��   H �� I J
�� 
prmp I m     K K � L L " S e l e c t   t h e   f o l d e r J �� M��
�� 
dflc M l    N���� N c     O P O n     Q R Q 1   	 ��
�� 
psxp R l   	 S���� S I   	�� T��
�� .earsffdralis        afdr T m    ��
�� afdrcusr��  ��  ��   P m    ��
�� 
TEXT��  ��  ��  ��  ��   D m    ��
�� 
TEXT ?  U V U l     ��������  ��  ��   V  W X W i   # & Y Z Y I      �������� &0 getfilefromdialog GetFileFromDialog��  ��   Z L      [ [ c      \ ] \ n      ^ _ ^ 1    ��
�� 
psxp _ l     `���� ` I    ���� a
�� .sysostdfalis    ��� null��   a �� b c
�� 
prmp b m     d d � e e  S e l e c t   t h e   f i l e c �� f��
�� 
dflc f l    g���� g c     h i h n     j k j 1   	 ��
�� 
psxp k l   	 l���� l I   	�� m��
�� .earsffdralis        afdr m m    ��
�� afdrcusr��  ��  ��   i m    ��
�� 
TEXT��  ��  ��  ��  ��   ] m    ��
�� 
TEXT X  n o n l     ��������  ��  ��   o  p q p i   ' * r s r I      �� t���� .0 getsubfoldersinfolder GetSubFoldersInFolder t  u�� u o      ���� 0 
folderpath 
FolderPath��  ��   s O     3 v w v k    2 x x  y z y r     { | { m     } } � ~ ~   | o      ���� 0 r   z   �  r     � � � n     � � � 2   ��
�� 
cfol � 4    �� �
�� 
cfol � o   
 ���� 0 
folderpath 
FolderPath � o      ���� 0 	myfolders 	myFolders �  � � � X    / ��� � � r   ! * � � � b   ! ( � � � l  ! & ����� � c   ! & � � � b   ! $ � � � o   ! "���� 0 r   � o   " #���� 0 f   � m   $ %��
�� 
TEXT��  ��   � m   & ' � � � � �  \ n � o      ���� 0 r  �� 0 f   � o    ���� 0 	myfolders 	myFolders �  � � � l  0 0��������  ��  ��   �  ��� � L   0 2 � � o   0 1���� 0 r  ��   w m      � ��                                                                                  MACS  alis    :  	HardyBook                      BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p   	 H a r d y B o o k  &System/Library/CoreServices/Finder.app  / ��   q  � � � l     ��������  ��  ��   �  � � � i   + . � � � I      �� ����� $0 getfilesinfolder GetFilesInFolder �  ��� � o      ���� 0 	posixpath 	POSIXPath��  ��   � I    	�� ���
�� .sysoexecTEXT���     TEXT � b      � � � b      � � � m      � � � � �  f i n d   - E   � o    ���� 0 	posixpath 	POSIXPath � m     � � � � � |   - i r e g e x   ' . * / [ ^ ~ ] [ ^ / ] * \ . ( d o c x | d o c | d o c m | d o t | d o t m ) $ '   - m a x d e p t h   1��   �  � � � l     ��������  ��  ��   �  � � � i   / 2 � � � I      �� ����� 0 killfileonmac KillFileOnMac �  ��� � o      ���� 0 filename FileName��  ��   � O      � � � I   �� ���
�� .sysoexecTEXT���     TEXT � b     � � � m     � � � � �  r m   � n    
 � � � 1    
��
�� 
strq � n     � � � 1    ��
�� 
psxp � o    ���� 0 filename FileName��   � m      � ��                                                                                  MACS  alis    :  	HardyBook                      BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p   	 H a r d y B o o k  &System/Library/CoreServices/Finder.app  / ��   �  � � � l     �������  ��  �   �  � � � i   3 6 � � � I      �~ ��}�~ "0 killfolderonmac KillFolderOnMac �  ��| � o      �{�{ 0 
foldername 
FolderName�|  �}   � O      � � � I   �z ��y
�z .sysoexecTEXT���     TEXT � b     � � � m     � � � � �  r m   - f r   � n    
 � � � 1    
�x
�x 
strq � n     � � � 1    �w
�w 
psxp � o    �v�v 0 
foldername 
FolderName�y   � m      � ��                                                                                  MACS  alis    :  	HardyBook                      BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p   	 H a r d y B o o k  &System/Library/CoreServices/Finder.app  / ��   �  � � � l     �u�t�s�u  �t  �s   �  � � � i   7 : � � � I      �r ��q�r 0 startrecord StartRecord �  ��p � o      �o�o 0 paramstring paramString�p  �q   � k      � �  � � � l     �n�m�l�n  �m  �l   �  � � � O      � � � k     � �  � � � I   	�k�j�i
�k .MVWRnwarnull��� ��� null�j  �i   �  ��h � I  
 �g ��f
�g .MVWRstarnull���     docu � 4   
 �e �
�e 
docu � m     � � � � �  A u d i o   R e c o r d i n g�f  �h   � m      � ��                                                                                  mgvr  alis    R  	HardyBook                      BD ����QuickTime Player.app                                           ����            ����  
 cu             Applications  +/:System:Applications:QuickTime Player.app/   *  Q u i c k T i m e   P l a y e r . a p p   	 H a r d y B o o k  (System/Applications/QuickTime Player.app  / ��   �  � � � l   �d�c�b�d  �c  �b   �  � � � L     � � m    �a�a  �  ��` � l   �_�^�]�_  �^  �]  �`   �  � � � l     �\�[�Z�\  �[  �Z   �  � � � i   ; > � � � I      �Y ��X�Y 0 
saverecord 
SaveRecord �  ��W � o      �V�V 0 filename FileName�W  �X   � k     : � �  � � � l     �U�T�S�U  �T  �S   �  � � � O     5 � � � k    4    r     o    �R�R 0 filename FileName o      �Q�Q 0 
exportfile 
exportFile �P O    4 k    3 	
	 I   �O�N
�O .MVWRstopnull���     docu 4    �M
�M 
docu m     �  A u d i o   R e c o r d i n g�N  
 �L O    3 k    2  I   *�K�J
�K .MVWRexponull���     docu�J   �I
�I 
kfil 4     $�H
�H 
file o   " #�G�G 0 
exportfile 
exportFile �F�E
�F 
expp m   % & �  A u d i o   O n l y�E   �D I  + 2�C�B
�C .coreclosnull���     obj �B   �A�@
�A 
savo m   - .�?
�? boovfals�@  �D   n      4   �>!
�> 
cobj! m    �=�=��  2   �<
�< 
docu�L   m    	""�                                                                                  mgvr  alis    R  	HardyBook                      BD ����QuickTime Player.app                                           ����            ����  
 cu             Applications  +/:System:Applications:QuickTime Player.app/   *  Q u i c k T i m e   P l a y e r . a p p   	 H a r d y B o o k  (System/Applications/QuickTime Player.app  / ��  �P   � m     ##�                                                                                  MACS  alis    :  	HardyBook                      BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p   	 H a r d y B o o k  &System/Library/CoreServices/Finder.app  / ��   � $%$ l  6 6�;�:�9�;  �:  �9  % &'& L   6 8(( m   6 7�8�8 ' )�7) l  9 9�6�5�4�6  �5  �4  �7   � *+* l     �3�2�1�3  �2  �1  + ,-, i   ? B./. I      �0�/�.�0 20 gethorizontalwindowsize GetHorizontalWindowSize�/  �.  / k     ,00 121 r     343 l    5�-�,5 n    676 I    �+�*�)�+ 0 visibleframe visibleFrame�*  �)  7 n    898 I    �(�'�&�( 0 
mainscreen 
mainScreen�'  �&  9 n    :;: o    �%�% 0 nsscreen NSScreen; m     �$
�$ misccura�-  �,  4 o      �#�# *0 visiblescreenbounds visibleScreenBounds2 <=< r    >?> n    @A@ 4    �"B
�" 
cobjB m    �!�! A n    CDC 4    � E
�  
cobjE m    �� D o    �� *0 visiblescreenbounds visibleScreenBounds? o      �� 0 leftpos leftPos= FGF r    !HIH n    JKJ 4    �L
� 
cobjL m    �� K n    MNM 4    �O
� 
cobjO m    �� N o    �� *0 visiblescreenbounds visibleScreenBoundsI o      �� 	0 width  G PQP l  " "����  �  �  Q RSR l  " "�TU�  T F @ AppleScriptTask wants a string so return values comma delimited   U �VV �   A p p l e S c r i p t T a s k   w a n t s   a   s t r i n g   s o   r e t u r n   v a l u e s   c o m m a   d e l i m i t e dS W�W L   " ,XX c   " +YZY b   " )[\[ b   " ']^] l  " %_��_ c   " %`a` o   " #�� 	0 width  a m   # $�
� 
TEXT�  �  ^ m   % &bb �cc  ,\ o   ' (�� 0 leftpos leftPosZ m   ) *�
� 
TEXT�  - ded l     ��
�	�  �
  �	  e fgf i   C Fhih I      �j�� 0 splitstring SplitStringj klk o      �� 0 thebigstring TheBigStringl m�m o      ��  0 fieldseparator fieldSeparator�  �  i k     nn opo O     qrq k    ss tut r    	vwv 1    �
� 
txdlw o      �� 0 oldtid oldTIDu xyx r   
 z{z o   
 ��  0 fieldseparator fieldSeparator{ 1    � 
�  
txdly |}| r    ~~ n    ��� 2   ��
�� 
citm� o    ���� 0 thebigstring TheBigString o      ���� 0 theitems theItems} ���� r    ��� o    ���� 0 oldtid oldTID� 1    ��
�� 
txdl��  r 1     ��
�� 
ascrp ���� L    �� o    ���� 0 theitems theItems��  g ��� l     ��������  ��  ��  � ��� i   G J��� I      ������� 0 activatetimer ActivateTimer� ���� o      ���� 0 timerapp TimerApp��  ��  � O    ��� I   ������
�� .miscactvnull��� ��� null��  ��  � 4     ���
�� 
capp� o    ���� 0 timerapp TimerApp� ��� l     ��������  ��  ��  � ��� i   K N��� I      ������� $0 getfromcitemaker GetFromCiteMaker� ���� o      ���� 0 paramstring paramString��  ��  � k     1�� ��� O     &��� k    %�� ��� I   	������
�� .miscactvnull��� ��� null��  ��  � ��� I  
 �����
�� .sysodelanull��� ��� nmbr� m   
 ���� ��  � ��� O   ��� I   ����
�� .prcskprsnull���     ctxt� m    �� ���  c� �����
�� 
faal� J    �� ��� m    ��
�� eMdsKctl� ���� m    ��
�� eMdsKopt��  ��  � m    ���                                                                                  sevs  alis    V  	HardyBook                      BD ����System Events.app                                              ����            ����  
 cu             CoreServices  0/:System:Library:CoreServices:System Events.app/  $  S y s t e m   E v e n t s . a p p   	 H a r d y B o o k  -System/Library/CoreServices/System Events.app   / ��  � ���� I    %�����
�� .sysodelanull��� ��� nmbr� m     !���� ��  ��  � m     ���                                                                                  rimZ  alis    8  	HardyBook                      BD ����Google Chrome.app                                              ����            ����  
 cu             Applications  !/:Applications:Google Chrome.app/   $  G o o g l e   C h r o m e . a p p   	 H a r d y B o o k  Applications/Google Chrome.app  / ��  � ���� O   ' 1��� I  + 0������
�� .miscactvnull��� ��� null��  ��  � m   ' (���                                                                                  MSWD  alis    <  	HardyBook                      BD ����Microsoft Word.app                                             ����            ����  
 cu             Applications  "/:Applications:Microsoft Word.app/  &  M i c r o s o f t   W o r d . a p p   	 H a r d y B o o k  Applications/Microsoft Word.app   / ��  ��  � ��� l     ��������  ��  ��  � ��� i   O R��� I      ������� 0 launchwebsite LaunchWebsite� ���� o      ���� 0 website  ��  ��  � O     ��� k    �� ��� I   	�����
�� .GURLGURLnull��� ��� TEXT� o    ���� 0 website  ��  � ���� I  
 ������
�� .miscactvnull��� ��� null��  ��  ��  � m     ��z                                                                                  sfri  alis      	HardyBook                      BD ����
Safari.app                                                     ����            ����  
 cu             Applications  /:Applications:Safari.app/   
 S a f a r i . a p p   	 H a r d y B o o k  Applications/Safari.app   / ��  � ���� l     ��������  ��  ��  ��       ���������������������  � ��������������������������������
�� 
pimr��  0 runshellscript RunShellScript�� 0 
openfolder 
OpenFolder�� *0 getfolderfromdialog GetFolderFromDialog�� &0 getfilefromdialog GetFileFromDialog�� .0 getsubfoldersinfolder GetSubFoldersInFolder�� $0 getfilesinfolder GetFilesInFolder�� 0 killfileonmac KillFileOnMac�� "0 killfolderonmac KillFolderOnMac�� 0 startrecord StartRecord�� 0 
saverecord 
SaveRecord�� 20 gethorizontalwindowsize GetHorizontalWindowSize�� 0 splitstring SplitString�� 0 activatetimer ActivateTimer�� $0 getfromcitemaker GetFromCiteMaker�� 0 launchwebsite LaunchWebsite� ����� �  ��� �����
�� 
cobj� ��   �� 
�� 
frmk��  � �����
�� 
cobj� ��   ��
�� 
osax��  � �� '����������  0 runshellscript RunShellScript�� ����� �  ���� 0 scripttorun ScriptToRun��  � ���� 0 scripttorun ScriptToRun� ��
�� .sysoexecTEXT���     TEXT�� �j  � �� 0���������� 0 
openfolder 
OpenFolder�� ����� �  ���� 0 
folderpath 
FolderPath��  � ���� 0 
folderpath 
FolderPath�  8 :��
�� .sysoexecTEXT���     TEXT�� 
�%�%j � �� A���������� *0 getfolderfromdialog GetFolderFromDialog��  ��  �  � 	�� K��������������
�� 
prmp
�� 
dflc
�� afdrcusr
�� .earsffdralis        afdr
�� 
psxp
�� 
TEXT�� 
�� .sysostflalis    ��� null�� *����j �,�&� �,�&� �� Z���������� &0 getfilefromdialog GetFileFromDialog��  ��  �  � 	�� d������������~
�� 
prmp
�� 
dflc
�� afdrcusr
�� .earsffdralis        afdr
�� 
psxp
�� 
TEXT� 
�~ .sysostdfalis    ��� null�� *����j �,�&� �,�&� �} s�|�{���z�} .0 getsubfoldersinfolder GetSubFoldersInFolder�| �y��y �  �x�x 0 
folderpath 
FolderPath�{  � �w�v�u�t�w 0 
folderpath 
FolderPath�v 0 r  �u 0 	myfolders 	myFolders�t 0 f  �  � }�s�r�q�p�o �
�s 
cfol
�r 
kocl
�q 
cobj
�p .corecnte****       ****
�o 
TEXT�z 4� 0�E�O*�/�-E�O �[��l kh ��%�&�%E�[OY��O�U� �n ��m�l���k�n $0 getfilesinfolder GetFilesInFolder�m �j��j �  �i�i 0 	posixpath 	POSIXPath�l  � �h�h 0 	posixpath 	POSIXPath�  � ��g
�g .sysoexecTEXT���     TEXT�k 
�%�%j � �f ��e�d���c�f 0 killfileonmac KillFileOnMac�e �b��b �  �a�a 0 filename FileName�d  � �`�` 0 filename FileName�  � ��_�^�]
�_ 
psxp
�^ 
strq
�] .sysoexecTEXT���     TEXT�c � ��,�,%j U� �\ ��[�Z���Y�\ "0 killfolderonmac KillFolderOnMac�[ �X��X �  �W�W 0 
foldername 
FolderName�Z  � �V�V 0 
foldername 
FolderName�  � ��U�T�S
�U 
psxp
�T 
strq
�S .sysoexecTEXT���     TEXT�Y � ��,�,%j U� �R ��Q�P���O�R 0 startrecord StartRecord�Q �N��N �  �M�M 0 paramstring paramString�P  � �L�L 0 paramstring paramString�  ��K�J ��I
�K .MVWRnwarnull��� ��� null
�J 
docu
�I .MVWRstarnull���     docu�O � *j O*��/j UOkOP� �H ��G�F���E�H 0 
saverecord 
SaveRecord�G �D��D �  �C�C 0 filename FileName�F  � �B�A�B 0 filename FileName�A 0 
exportfile 
exportFile� #"�@�?�>�=�<�;�:�9�8�7
�@ 
docu
�? .MVWRstopnull���     docu
�> 
cobj
�= 
kfil
�< 
file
�; 
expp�: 
�9 .MVWRexponull���     docu
�8 
savo
�7 .coreclosnull���     obj �E ;� 2�E�O� )*��/j O*�-�i/ *�*�/��� O*�fl UUUOkOP� �6/�5�4� �3�6 20 gethorizontalwindowsize GetHorizontalWindowSize�5  �4  � �2�1�0�2 *0 visiblescreenbounds visibleScreenBounds�1 0 leftpos leftPos�0 	0 width    �/�.�-�,�+�*b
�/ misccura�. 0 nsscreen NSScreen�- 0 
mainscreen 
mainScreen�, 0 visibleframe visibleFrame
�+ 
cobj
�* 
TEXT�3 -��,j+ j+ E�O��k/�k/E�O��l/�k/E�O��&�%�%�&� �)i�(�'�&�) 0 splitstring SplitString�( �%�%   �$�#�$ 0 thebigstring TheBigString�#  0 fieldseparator fieldSeparator�'   �"�!� ��" 0 thebigstring TheBigString�!  0 fieldseparator fieldSeparator�  0 oldtid oldTID� 0 theitems theItems ���
� 
ascr
� 
txdl
� 
citm�&  � *�,E�O�*�,FO��-E�O�*�,FUO�� ������ 0 activatetimer ActivateTimer� ��   �� 0 timerapp TimerApp�   �� 0 timerapp TimerApp ��
� 
capp
� .miscactvnull��� ��� null� *�/ *j U� ������ $0 getfromcitemaker GetFromCiteMaker� �	� 	  �� 0 paramstring paramString�   �� 0 paramstring paramString 
���
���	����
� .miscactvnull��� ��� null
�
 .sysodelanull��� ��� nmbr
�	 
faal
� eMdsKctl
� eMdsKopt
� .prcskprsnull���     ctxt� 2� #*j Okj O� ����lvl UOkj UO� *j U� ����
�� 0 launchwebsite LaunchWebsite� ��   � �  0 website  �  
 ���� 0 website   �����
�� .GURLGURLnull��� ��� TEXT
�� .miscactvnull��� ��� null� � �j O*j Uascr  ��ޭ