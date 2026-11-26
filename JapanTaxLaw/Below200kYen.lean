import JapanTaxLaw.TaxFinance

/-!
# Below200kYen — 所得税法施行令 art.182の2「二十万円未満である場合」
Sources (pinned): law `340CO0000000096` / rev `340CO0000000096_20260522_508CO0000000093`.
原文: 「二十万円未満である場合」
Computation: below(amount) = amount < 200_000（「未満」なので境界値 20万は除外）。
Scope: 金額の算定・適用先は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.Below200kYen

def limitYen : Nat := 200_000

def below (amount : Nat) : Bool := amount < limitYen

example : below 199_999 = true := by decide
example : below 200_000 = false := by decide
example : below 200_001 = false := by decide

end JapanTaxLaw.Below200kYen
