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
 F i n d e r . a p p   	 H a r d y B o o k  &System/Library/CoreServices/Finder.app  / ��   �  � � � l     �u�t�s�u  �t  �s   �  � � � i   7 : � � � I      �r ��q�r 0 startrecord StartRecord �  ��p � o      �o�o 0 paramstring paramString�p  �q   � k      � �  � � � O      � � � k     � �  � � � I   	�n�m�l
�n .MVWRnwarnull��� ��� null�m  �l   �  ��k � I  
 �j ��i
�j .MVWRstarnull���     docu � 4   
 �h �
�h 
docu � m     � � � � �  A u d i o   R e c o r d i n g�i  �k   � m      � ��                                                                                  mgvr  alis    R  	HardyBook                      BD ����QuickTime Player.app                                           ����            ����  
 cu             Applications  +/:System:Applications:QuickTime Player.app/   *  Q u i c k T i m e   P l a y e r . a p p   	 H a r d y B o o k  (System/Applications/QuickTime Player.app  / ��   �  � � � l   �g�f�e�g  �f  �e   �  ��d � L     � � m    �c�c �d   �  � � � l     �b�a�`�b  �a  �`   �  � � � i   ; > � � � I      �_ ��^�_ 0 
saverecord 
SaveRecord �  ��] � o      �\�\ 0 filename FileName�]  �^   � k     > � �  � � � r      � � � 4     �[ �
�[ 
psxf � o    �Z�Z 0 filename FileName � o      �Y�Y 0 
exportpath 
exportPath �  � � � O    ; � � � k    : � �    I   �X�W
�X .MVWRstopnull���     docu 4    �V
�V 
docu m     �  A u d i o   R e c o r d i n g�W    r    %	 n    #

 4    #�U
�U 
cobj m   ! "�T�T�� l    �S�R 6     2   �Q
�Q 
docu E     1    �P
�P 
pnam m     �  U n t i t l e d�S  �R  	 o      �O�O 0 doc    I  & 2�N
�N .MVWRexponull���     docu o   & '�M�M 0 doc   �L
�L 
kfil 4   ( ,�K
�K 
file o   * +�J�J 0 
exportpath 
exportPath �I�H
�I 
expp m   - . �  A u d i o   O n l y�H   �G I  3 :�F�E
�F .coreclosnull���     obj �E   �D �C
�D 
savo  m   5 6�B
�B boovfals�C  �G   � m    !!�                                                                                  mgvr  alis    R  	HardyBook                      BD ����QuickTime Player.app                                           ����            ����  
 cu             Applications  +/:System:Applications:QuickTime Player.app/   *  Q u i c k T i m e   P l a y e r . a p p   	 H a r d y B o o k  (System/Applications/QuickTime Player.app  / ��   � "#" l  < <�A�@�?�A  �@  �?  # $�>$ L   < >%% m   < =�=�= �>   � &'& l     �<�;�:�<  �;  �:  ' ()( i   ? B*+* I      �9�8�7�9 20 gethorizontalwindowsize GetHorizontalWindowSize�8  �7  + k     ,,, -.- r     /0/ l    1�6�51 n    232 I    �4�3�2�4 0 visibleframe visibleFrame�3  �2  3 n    454 I    �1�0�/�1 0 
mainscreen 
mainScreen�0  �/  5 n    676 o    �.�. 0 nsscreen NSScreen7 m     �-
�- misccura�6  �5  0 o      �,�, *0 visiblescreenbounds visibleScreenBounds. 898 r    :;: n    <=< 4    �+>
�+ 
cobj> m    �*�* = n    ?@? 4    �)A
�) 
cobjA m    �(�( @ o    �'�' *0 visiblescreenbounds visibleScreenBounds; o      �&�& 0 leftpos leftPos9 BCB r    !DED n    FGF 4    �%H
�% 
cobjH m    �$�$ G n    IJI 4    �#K
�# 
cobjK m    �"�" J o    �!�! *0 visiblescreenbounds visibleScreenBoundsE o      � �  	0 width  C LML l  " "����  �  �  M NON l  " "�PQ�  P F @ AppleScriptTask wants a string so return values comma delimited   Q �RR �   A p p l e S c r i p t T a s k   w a n t s   a   s t r i n g   s o   r e t u r n   v a l u e s   c o m m a   d e l i m i t e dO S�S L   " ,TT c   " +UVU b   " )WXW b   " 'YZY l  " %[��[ c   " %\]\ o   " #�� 	0 width  ] m   # $�
� 
TEXT�  �  Z m   % &^^ �__  ,X o   ' (�� 0 leftpos leftPosV m   ) *�
� 
TEXT�  ) `a` l     ����  �  �  a bcb i   C Fded I      �f�� 0 splitstring SplitStringf ghg o      �� 0 thebigstring TheBigStringh i�i o      ��  0 fieldseparator fieldSeparator�  �  e k     jj klk O     mnm k    oo pqp r    	rsr 1    �
� 
txdls o      �� 0 oldtid oldTIDq tut r   
 vwv o   
 �
�
  0 fieldseparator fieldSeparatorw 1    �	
�	 
txdlu xyx r    z{z n    |}| 2   �
� 
citm} o    �� 0 thebigstring TheBigString{ o      �� 0 theitems theItemsy ~�~ r    � o    �� 0 oldtid oldTID� 1    �
� 
txdl�  n 1     �
� 
ascrl ��� L    �� o    � �  0 theitems theItems�  c ��� l     ��������  ��  ��  � ��� i   G J��� I      ������� 0 activatetimer ActivateTimer� ���� o      ���� 0 timerapp TimerApp��  ��  � O    ��� I   ������
�� .miscactvnull��� ��� null��  ��  � 4     ���
�� 
capp� o    ���� 0 timerapp TimerApp� ��� l     ��������  ��  ��  � ��� i   K N��� I      ������� (0 getfromcitecreator GetFromCiteCreator� ���� o      ���� 0 paramstring paramString��  ��  � k     1�� ��� O     &��� k    %�� ��� I   	������
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
 cu             Applications  "/:Applications:Microsoft Word.app/  &  M i c r o s o f t   W o r d . a p p   	 H a r d y B o o k  Applications/Microsoft Word.app   / ��  ��  � ���� l     ��������  ��  ��  ��       ��������������������  � ������������������������������
�� 
pimr��  0 runshellscript RunShellScript�� 0 
openfolder 
OpenFolder�� *0 getfolderfromdialog GetFolderFromDialog�� &0 getfilefromdialog GetFileFromDialog�� .0 getsubfoldersinfolder GetSubFoldersInFolder�� $0 getfilesinfolder GetFilesInFolder�� 0 killfileonmac KillFileOnMac�� "0 killfolderonmac KillFolderOnMac�� 0 startrecord StartRecord�� 0 
saverecord 
SaveRecord�� 20 gethorizontalwindowsize GetHorizontalWindowSize�� 0 splitstring SplitString�� 0 activatetimer ActivateTimer�� (0 getfromcitecreator GetFromCiteCreator� ����� �  ��� �����
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
�� .sysostflalis    ��� null�� *����j �,�&� �,�&� �� Z���������� &0 getfilefromdialog GetFileFromDialog��  ��  �  � 	�� d��������������
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
�� .sysostdfalis    ��� null�� *����j �,�&� �,�&� �� s���������� .0 getsubfoldersinfolder GetSubFoldersInFolder�� ����� �  ���� 0 
folderpath 
FolderPath��  � ���������� 0 
folderpath 
FolderPath�� 0 r  �� 0 	myfolders 	myFolders�� 0 f  �  � }���������� �
�� 
cfol
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
TEXT�� 4� 0�E�O*�/�-E�O �[��l kh ��%�&�%E�[OY��O�U� �� ����������� $0 getfilesinfolder GetFilesInFolder�� ����� �  ���� 0 	posixpath 	POSIXPath��  � ���� 0 	posixpath 	POSIXPath�  � ��
� .sysoexecTEXT���     TEXT�� 
�%�%j � �~ ��}�|���{�~ 0 killfileonmac KillFileOnMac�} �z��z �  �y�y 0 filename FileName�|  � �x�x 0 filename FileName�  � ��w�v�u
�w 
psxp
�v 
strq
�u .sysoexecTEXT���     TEXT�{ � ��,�,%j U� �t ��s�r���q�t "0 killfolderonmac KillFolderOnMac�s �p��p �  �o�o 0 
foldername 
FolderName�r  � �n�n 0 
foldername 
FolderName�  � ��m�l�k
�m 
psxp
�l 
strq
�k .sysoexecTEXT���     TEXT�q � ��,�,%j U� �j ��i�h���g�j 0 startrecord StartRecord�i �f��f �  �e�e 0 paramstring paramString�h  � �d�d 0 paramstring paramString�  ��c�b ��a
�c .MVWRnwarnull��� ��� null
�b 
docu
�a .MVWRstarnull���     docu�g � *j O*��/j UOk� �` ��_�^���]�` 0 
saverecord 
SaveRecord�_ �\��\ �  �[�[ 0 filename FileName�^  � �Z�Y�X�Z 0 filename FileName�Y 0 
exportpath 
exportPath�X 0 doc  � �W!�V�U��T�S�R�Q�P�O�N�M�L
�W 
psxf
�V 
docu
�U .MVWRstopnull���     docu�  
�T 
pnam
�S 
cobj
�R 
kfil
�Q 
file
�P 
expp�O 
�N .MVWRexponull���     docu
�M 
savo
�L .coreclosnull���     obj �] ?*�/E�O� 1*��/j O*�-�[�,\Z�@1�i/E�O��*�/��� O*�fl UOk� �K+�J�I���H�K 20 gethorizontalwindowsize GetHorizontalWindowSize�J  �I  � �G�F�E�G *0 visiblescreenbounds visibleScreenBounds�F 0 leftpos leftPos�E 	0 width  � �D�C�B�A�@�?^
�D misccura�C 0 nsscreen NSScreen�B 0 
mainscreen 
mainScreen�A 0 visibleframe visibleFrame
�@ 
cobj
�? 
TEXT�H -��,j+ j+ E�O��k/�k/E�O��l/�k/E�O��&�%�%�&� �>e�=�<���;�> 0 splitstring SplitString�= �:��: �  �9�8�9 0 thebigstring TheBigString�8  0 fieldseparator fieldSeparator�<  � �7�6�5�4�7 0 thebigstring TheBigString�6  0 fieldseparator fieldSeparator�5 0 oldtid oldTID�4 0 theitems theItems� �3�2�1
�3 
ascr
�2 
txdl
�1 
citm�;  � *�,E�O�*�,FO��-E�O�*�,FUO�� �0��/�.���-�0 0 activatetimer ActivateTimer�/ �,��, �  �+�+ 0 timerapp TimerApp�.  � �*�* 0 timerapp TimerApp� �)�(
�) 
capp
�( .miscactvnull��� ��� null�- *�/ *j U� �'��&�%���$�' (0 getfromcitecreator GetFromCiteCreator�& �#��# �  �"�" 0 paramstring paramString�%  � �!�! 0 paramstring paramString� 
�� ��������
�  .miscactvnull��� ��� null
� .sysodelanull��� ��� nmbr
� 
faal
� eMdsKctl
� eMdsKopt
� .prcskprsnull���     ctxt�$ 2� #*j Okj O� ����lvl UOkj UO� *j Uascr  ��ޭ