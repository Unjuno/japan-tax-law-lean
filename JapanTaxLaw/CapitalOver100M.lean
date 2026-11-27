import JapanTaxLaw.TaxFinance

/-!
# CapitalOver100M — 租税特別措置法 art.61の4（資本金1億円超）
Sources (pinned): law `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`.
原文: 「当該適用年度終了の日における資本金の額又は出資金の額が一億円を超える法人」
Computation: over100M(capital) = capital > 100_000_000（「超える」なので境界値は除外）。
Scope: 資本金の算定・法人の認定は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.CapitalOver100M

def thresholdYen : Nat := 100_000_000

def over100M (capital : Nat) : Bool := capital > thresholdYen

example : over100M 100_000_000 = false := by decide
example : over100M 100_000_001 = true := by decide

end JapanTaxLaw.CapitalOver100M
