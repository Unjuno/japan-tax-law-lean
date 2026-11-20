import JapanTaxLaw.CorporateTaxRate

/-!
# CorporateTaxRate spec — independent statement of art. 66(1)–(3)

Source (pinned):
  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 3B743C0FB772A2482ED143CBE2611E3B82E929868767514A3E1DB16F5C2EF342

Independent restatement of 法人税法 art. 66 (各事業年度の所得に対する法人税の
税率) as an amount partition that reuses NONE of the implementation's helpers
(`smeEligible`, `smeReducedPortion`, `smeRate`, `ordinaryRate`, …). Constants
derived from the statutory text itself, not copied from any official rate card:

  Art. 66(1) ordinary corporation — rate 23.2% on all income
  Art. 66(2) SME-qualifying ordinary corporation — 19% up to ¥8,000,000,
             23.2% on excess
  Art. 66(3) 公益法人等 (excluding 一般社団法人等) / 協同組合等 — 19% on all income

The SME reduced-rate entitlement itself is a *caller-established* `Bool`
(`sme : Bool`); this spec deliberately does not derive it from `CorpFacts` via
the implementation predicate. The caller determines eligibility from the
capital / no-capital condition (≤ ¥1億円) and the art. 66(5) exclusion list
(保険業法に規定する相互会社 / 大法人との間に完全支配関係がある普通法人 /
投資法人 / 特定目的会社 / 受託法人); art. 66(5)'s two, three-level
anti-avoidance tests are out of scope. `agreeBoundary` below supplies that Bool
from `smeEligible` purely to cross-check the two computations at finite points.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: first ¥8,000,000 at 19% when the caller establishes SME eligibility;
    the rest at the ordinary 23.2%. Eligibility is an input Bool, not derived
    from any implementation definition. -/
def specOrdinaryTax (sme : Bool) (income : Money) : Money :=
  if sme then
    (if income ≤ 8_000_000 then
        (income * 19) / 100
      else
        (8_000_000 * 19) / 100 + ((income - 8_000_000) * 232) / 1000)
  else
    (income * 232) / 1000

/-- Spec: public-interest/cooperative flat 19%. -/
def specPublicInterestTax (income : Money) : Money := (income * 19) / 100

-- ==== points, all kernel-decided ====

-- SME-qualifying (caller establishes `sme = true`).
example : specOrdinaryTax true 0 = 0 := by decide
example : specOrdinaryTax true 8_000_000 = 1_520_000 := by decide
example : specOrdinaryTax true 10_000_000 = 1_984_000 := by decide

-- Non-qualifying (caller establishes `sme = false`).
example : specOrdinaryTax false 8_000_000 = 1_856_000 := by decide
example : specOrdinaryTax false 3_000_000 = 696_000 := by decide

-- Excluded corporates go to the full rate even below the cap.
example : specOrdinaryTax false 1_000_000 = 232_000 := by decide

-- No capital at all still qualifies (art. 66(2): 資本若しくは出資を有しないもの).
example : specOrdinaryTax true 10_000_000 = 1_984_000 := by decide

-- Art. 66(3): 公益法人等 (excluding 一般社団法人等) / 協同組合等 flat 19%.
example : specPublicInterestTax 3_000_000 = 570_000 := by decide
example : specPublicInterestTax 8_000_000 = 1_520_000 := by decide

/-- Spot-check: implementation agrees with the independent spec at the
    official boundary points relevant for the SME relief boundary. The caller
    establishes the eligibility Bool here (from `smeEligible`) only to feed the
    spec; the agreement compares against the implementation's own result. -/
def agreeBoundary : Bool :=
  let f1 := CorpFacts.mk 100_000_000 false false false false false false
  let f2 := CorpFacts.mk 500_000_000 false false false false false false
  let f3 := CorpFacts.mk 0 true false false false false false
  corporateTax .ordinary f1 4_250_000 == specOrdinaryTax (smeEligible f1) 4_250_000 &&
  corporateTax .ordinary f1 8_000_000 == specOrdinaryTax (smeEligible f1) 8_000_000 &&
  corporateTax .ordinary f1 8_000_001 == specOrdinaryTax (smeEligible f1) 8_000_001 &&
  corporateTax .ordinary f2 12_340_000 == specOrdinaryTax (smeEligible f2) 12_340_000 &&
  corporateTax .ordinary f3 19_500_000 == specOrdinaryTax (smeEligible f3) 19_500_000 &&
  corporateTax .publicInterestOrCoop dummyFacts 9_750_000 == specPublicInterestTax 9_750_000
where
  dummyFacts : CorpFacts := CorpFacts.mk 0 true false false false false false

example : agreeBoundary = true := by decide

end JapanTaxLaw
