import JapanTaxLaw.TaxFinance

/-!
# LocalTaxReducedRate2or1 — 地方税法 art.37 2%／指定都市1%（bounded L4 モデル）

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
raw data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
原文逐語: 「次に掲げる金額のうちいずれか少ない金額の百分の二（当該納税義務者が
指定都市の区域内に住所を有する場合には、百分の一）に相当する金額」
Computation（原文の二つの割合のみ、Nat の下限切り捨て）:
  amount(base, designatedCity) = base * (if designatedCity then 1 else 2) / 100
Scope / NOT MODELLED: 「次に掲げる金額」の算定・指定都市の認定・端数処理は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxReducedRate2or1

open JapanTaxLaw.TaxFinance

def normalNum : Nat := 2
def designatedNum : Nat := 1
def rateDen : Nat := 100

def amount (base : Money) (designatedCity : Bool) : Money :=
  base * (if designatedCity then designatedNum else normalNum) / rateDen

example : amount 10_000 false = 200 := by decide
example : amount 10_000 true = 100 := by decide

end JapanTaxLaw.LocalTaxReducedRate2or1
