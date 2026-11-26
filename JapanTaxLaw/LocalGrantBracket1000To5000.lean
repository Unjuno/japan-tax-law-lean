import JapanTaxLaw.TaxFinance

/-!
# LocalGrantBracket1000To5000 — 地方税法 art.72の21「千億円を超え五千億円以下の金額」
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「千億円を超え五千億円以下の金額」
Computation（入力は億円単位の自然数。境界を含むかどうかのみ）:
  inBracket(x) = x > 1000 && x <= 5000（下限「超え」は除外、上限「以下」は包含）
Scope: 金額の算定・適用先は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalGrantBracket1000To5000

def lowerOku : Nat := 1000
def upperOku : Nat := 5000

def inBracket (oku : Nat) : Bool :=
  oku > lowerOku && oku <= upperOku

example : inBracket 1000 = false := by decide
example : inBracket 1001 = true := by decide
example : inBracket 5000 = true := by decide
example : inBracket 5001 = false := by decide

end JapanTaxLaw.LocalGrantBracket1000To5000
