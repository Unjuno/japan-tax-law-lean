import JapanTaxLaw.TaxFinance

/-!
# LocalBusinessTaxOrderRate77PerMilleC — 地方税法施行令 art.35の4の5 7.7%（bounded L4 モデル）

Sources (pinned): law 325CO0000000245, revision 325CO0000000245_20261101_508CO0000000083,
raw data/raw/325CO0000000245_20261101_508CO0000000083.law.json.
原文逐語: 「法第七十二条の七十六の政令で定める率は、百分の七・七とする。」
Computation（原文の割合 7.7% = 77/1000 の適用のみ、Nat の下限切り捨て）:
  rateAmount(base) = base * 77 / 1000
Scope / NOT MODELLED: 法第72条の76の要件・基礎となる金額・端数は NOT MODELLED。
art.35の4の7 と同一割合を別の表セルで扱う。法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalBusinessTaxOrderRate77PerMilleC

open JapanTaxLaw.TaxFinance

def rateNum : Nat := 77
def rateDen : Nat := 1000

def rateAmount (base : Money) : Money :=
  base * rateNum / rateDen

example : rateAmount 0 = 0 := by decide
example : rateAmount 1 = 0 := by decide
example : rateAmount 1000 = 77 := by decide
example : rateAmount 10000 = 770 := by decide

end JapanTaxLaw.LocalBusinessTaxOrderRate77PerMilleC
