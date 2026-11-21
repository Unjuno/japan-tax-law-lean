/-\!
# LegalStructuralMarkersSpec — 独立形式仕様

pinned 原文（法令構造マーカー 10817条片）から独立に読み取った仕様。実装を import しない。

全角ラテン文字は A=1..Z=26 の序数、令和年号は 令元=1, 令２=2.. の年番号、
構造マーカーは宣言としてのみ記録、施行は公布日(0)または翌日(1)のオフセット。
マーカーが付された規定の実質的内容は NOT MODELLED（PROVED_SCOPE）。
-/
namespace JapanTaxLaw.LegalStructuralMarkersSpec

def latinTable : List (Char × Nat) :=
  [('Ａ',1),('Ｂ',2),('Ｃ',3),('Ｄ',4),('Ｅ',5),('Ｆ',6),('Ｇ',7),('Ｈ',8),
   ('Ｉ',9),('Ｊ',10),('Ｋ',11),('Ｌ',12),('Ｍ',13),('Ｎ',14),('Ｏ',15),('Ｐ',16),
   ('Ｑ',17),('Ｒ',18),('Ｓ',19),('Ｔ',20),('Ｕ',21),('Ｖ',22),('Ｗ',23),('Ｘ',24),
   ('Ｙ',25),('Ｚ',26)]

def lookup (tab : List (Char × Nat)) (c : Char) : Option Nat :=
  match tab with
  | [] => none
  | (k, v) :: rest => if c == k then some v else lookup rest c

def reiwaTable : List (String × Nat) :=
  [("令元",1),("令１",1),("令２",2),("令３",3),("令４",4),
   ("令５",5),("令６",6),("令７",7),("令８",8),("令９",9)]

def lookupStr (tab : List (String × Nat)) (s : String) : Option Nat :=
  match tab with
  | [] => none
  | (k, v) :: rest => if s == k then some v else lookupStr rest s

def markerSpec : Prop := True
def offsetSpec (nextDay : Bool) : Nat := if nextDay then 1 else 0

end JapanTaxLaw.LegalStructuralMarkersSpec
