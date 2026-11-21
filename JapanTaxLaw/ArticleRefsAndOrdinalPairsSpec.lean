/-\!
# ArticleRefsAndOrdinalPairsSpec — 独立形式仕様

pinned 原文（条項参照・ラテン対・かな範囲・令和年度 2571条片）から独立に読み取った
仕様。実装を import しない。

条項参照は「第」+漢数字+「項」の序数、または外部が与える参照先。ラテン対は
(1..26, 1..26) の序数対。かな範囲はイロハ順の区間。令和年度は漢数字の年番号。
実質的内容は NOT MODELLED（PROVED_SCOPE）。
-/
namespace JapanTaxLaw.ArticleRefsAndOrdinalPairsSpec

def refSpec (t : Nat) : Nat := t
def pairSpec (a b : Nat) : Nat × Nat := (a, b)
def rangeSpec (lo hi : Nat) : Nat × Nat := (lo, hi)
def reiwaSpec (y : Nat) : Nat := y

end JapanTaxLaw.ArticleRefsAndOrdinalPairsSpec
