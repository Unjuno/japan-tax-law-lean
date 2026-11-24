import JapanTaxLaw.TaxFinance

/-!
# LocalBusinessTaxRate77PerMilleB — 地方税法施行令 art.57の2の8 事業税 7.7%（bounded L4 モデル）

Sources (pinned): law 325CO0000000245, revision 325CO0000000245_20261101_508CO0000000083,
raw data/raw/325CO0000000245_20261101_508CO0000000083.law.json.
原文逐語: 「…事業税の額（次の各号に掲げる場合には、当該各号に定める額。以下この表において同じ。）の百分の七・七に相当する額」
Computation（原文の割合 7.7% = 77/1000 の適用のみ、Nat の下限切り捨て）:
  rateAmount(base) = base * 77 / 1000
Scope / NOT MODELLED: 事業税額そのもの・各号に定める額・端数は NOT MODELLED。
art.35の4の7 と同一の割合を別の表セルで扱う。本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalBusinessTaxRate77PerMilleB

open JapanTaxLaw.TaxFinance

def rateNum : Nat := 77
def rateDen : Nat := 1000

def rateAmount (base : Money) : Money :=
  base * rateNum / rateDen

example : rateAmount 0 = 0 := by decide
example : rateAmount 1 = 0 := by decide
example : rateAmount 1000 = 77 := by decide
example : rateAmount 10000 = 770 := by decide

end JapanTaxLaw.LocalBusinessTaxRate77PerMilleB
