import JapanTaxLaw.TaxFinance

/-!
# LocalInhabitantReducedRate3or4 — 地方税法 art.314の6 3%／指定都市4%（bounded L4 モデル）

Sources (pinned): law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002,
raw data/raw/325AC0000000226_20261101_508AC0000000002.law.json.
原文逐語: 「次に掲げる金額のうちいずれか少ない金額の百分の三（当該納税義務者が
指定都市の区域内に住所を有する場合には、百分の四）に相当する金額」
Computation（原文の二つの割合のみ、Nat の下限切り捨て）:
  amount(base, designatedCity) = base * (if designatedCity then 4 else 3) / 100
Scope / NOT MODELLED: 「次に掲げる金額」の算定・指定都市の認定・端数処理は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalInhabitantReducedRate3or4

open JapanTaxLaw.TaxFinance

def normalNum : Nat := 3
def designatedNum : Nat := 4
def rateDen : Nat := 100

def amount (base : Money) (designatedCity : Bool) : Money :=
  base * (if designatedCity then designatedNum else normalNum) / rateDen

example : amount 10_000 false = 300 := by decide
example : amount 10_000 true = 400 := by decide

end JapanTaxLaw.LocalInhabitantReducedRate3or4
