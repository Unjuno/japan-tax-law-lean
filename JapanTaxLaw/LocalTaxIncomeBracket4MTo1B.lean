import JapanTaxLaw.TaxFinance

/-!
# LocalTaxIncomeBracket4MTo1B — 地方税法 art.9の2「年四百万円を超え年十億円以下の金額」
Sources (pinned): law `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`.
原文: 「各事業年度の所得のうち年四百万円を超え年十億円以下の金額」
Computation（入力は円。境界を含むかどうかのみ）:
  inBracket(x) = x > 4_000_000 && x <= 1_000_000_000
Scope: 所得の算定・適用先は NOT MODELLED。法的レビューを提供しない。
-/

namespace JapanTaxLaw.LocalTaxIncomeBracket4MTo1B

def lowerYen : Nat := 4_000_000
def upperYen : Nat := 1_000_000_000

def inBracket (yen : Nat) : Bool :=
  yen > lowerYen && yen <= upperYen

example : inBracket 4_000_000 = false := by decide
example : inBracket 4_000_001 = true := by decide
example : inBracket 1_000_000_000 = true := by decide
example : inBracket 1_000_000_001 = false := by decide

end JapanTaxLaw.LocalTaxIncomeBracket4MTo1B
