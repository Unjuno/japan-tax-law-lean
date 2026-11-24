import JapanTaxLaw.TaxFinance

/-!
# UnclearValueDefault — 財務省令（令和七年一二月五日第六八号）ただし書（数値不明時の代替）

Sources (pinned):
  Law id: 332M50000040015
  Revision: 332M50000040015_20261101_507M60000040026
  Raw snapshot: data/raw/332M50000040015_20261101_507M60000040026.law.json
  Normative unit: 1d80c375432e… (EXCEPTION, 数値が明らかでないとき)

原文逐語:
  「ただし、当該数値が明らかでないときは、百分の一・九とする。」

The clause supplies a DEFAULT when the underlying value is unavailable: 1.9%,
encoded as 19 per-mille. The normal (known) value is caller-established.

Domain: Option Nat — `none` = 数値が明らかでない, `some v` = known value v
(per-mille). Result: Nat (per-mille rate). This models only the fallback rule;
the underlying measurement and the main rule are NOT MODELLED.
-/

namespace JapanTaxLaw.UnclearValueDefault

/-- 不明時の代替値: 百分の一・九 = 千分の十九。 -/
def defaultPerMille : Nat := 19

/-- 実装: 既知ならその値、不明なら代替値。 -/
def resolveRate (known : Option Nat) : Nat :=
  match known with
  | some v => v
  | none => defaultPerMille

end JapanTaxLaw.UnclearValueDefault
