/-\!
# BareLabelFragmentsSpec — 独立形式仕様

pinned 原文（単独ラベル片 72,069条片）から独立に読み取った仕様。実装を import しない。

数字ラベルは十進の値へ、いろはラベルはいろは順の序数へ写像する。
括弧見出しは構造宣言としてのみ記録する。
ラベルが付された規定の実質的内容は NOT MODELLED（したがって PROVED_SCOPE）。
-/
namespace JapanTaxLaw.BareLabelFragmentsSpec

def digitTable : List (Char × Nat) :=
  [('0',0),('1',1),('2',2),('3',3),('4',4),('5',5),('6',6),('7',7),('8',8),('9',9),
   ('０',0),('１',1),('２',2),('３',3),('４',4),('５',5),('６',6),('７',7),('８',8),('９',9)]

def kanaTable : List (Char × Nat) :=
  [('イ',1),('ロ',2),('ハ',3),('ニ',4),('ホ',5),('ヘ',6),('ト',7),('チ',8),
   ('リ',9),('ヌ',10),('ル',11),('ヲ',12),('ワ',13),('カ',14),('ヨ',15),('タ',16),
   ('レ',17),('ソ',18),('ツ',19),('ネ',20),('ナ',21),('ラ',22),('ム',23),('ウ',24),
   ('ヰ',25),('ノ',26),('オ',27),('ク',28),('ヤ',29),('マ',30),('ケ',31),('フ',32),
   ('コ',33),('エ',34),('テ',35),('ア',36),('サ',37),('キ',38),('ユ',39),('メ',40),
   ('ミ',41),('シ',42),('ヱ',43),('ヒ',44),('モ',45),('セ',46),('ス',47),('ン',48)]

def lookup (tab : List (Char × Nat)) (c : Char) : Option Nat :=
  match tab with
  | [] => none
  | (k, v) :: rest => if c == k then some v else lookup rest c

def parseDigitsSpec (s : String) : Option Nat :=
  match s.toList with
  | [] => none
  | cs => cs.foldl (fun acc c => (fun a d => a * 10 + d) <$> acc <*> lookup digitTable c) (some 0)

def kanaOrdinalSpec (c : Char) : Option Nat := lookup kanaTable c

def headingDeclaredSpec : Prop := True

end JapanTaxLaw.BareLabelFragmentsSpec
