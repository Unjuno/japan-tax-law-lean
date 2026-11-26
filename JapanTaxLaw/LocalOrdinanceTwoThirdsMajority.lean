import JapanTaxLaw.TaxFinance

/-!
# LocalOrdinanceTwoThirdsMajority — 地方自治法 art. 4（条例制定・改廃 出席議員の三分の二以上の同意）

Source layer: NATIONAL_NON_TAX_RELATED (separate from the 327-law tax inventory).

Sources (pinned):

  Law id: 322AC0000000067
  Revision: 322AC0000000067_20261102_508AC0000000062
  Raw snapshot: data/related_raw/322AC0000000067_20261102_508AC0000000062.law.json

Pinned 原文: 「第一項の条例を制定し又は改廃しようとするときは、当該地方公共団体の議会において出席議員の三分の二以上の者の同意がなければならない。」

Scoped claim: only the two-thirds supermajority numeric condition
`3 × yes >= 2 × attending` with `attending > 0`; the surrounding ordinance
procedure, quorum and other requirements are caller-established.
-/

namespace JapanTaxLaw.LocalOrdinanceTwoThirdsMajority

def numerator : Nat := 2
def denominator : Nat := 3

def hasTwoThirds (yes attending : Nat) : Bool :=
  decide (0 < attending ∧ denominator * yes >= numerator * attending)

theorem fractions_value : numerator = 2 ∧ denominator = 3 := by
  constructor <;> rfl

end JapanTaxLaw.LocalOrdinanceTwoThirdsMajority
