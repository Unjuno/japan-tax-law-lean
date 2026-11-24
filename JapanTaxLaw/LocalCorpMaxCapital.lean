import JapanTaxLaw.TaxFinance

/-
# LocalCorpMaxCapital — 第二条（被合併法人二以上の最大額選択）

Pinned source (independent re-extraction from the raw blob):
  Law id: 403CO0000000035
  Revision: 403CO0000000035_20010106_412CO0000000307
  Raw snapshot: data/raw/403CO0000000035_20010106_412CO0000000307.law.json
  sha256: a0d48602a650d424251a63b1f4e312f3f0f5b5c3fd91b6adddf184ea04a6a06e
  Statutory article: 第二条 (art. 2; raw JSON Article attr.Num = "2").
  Enforced: 2001-01-06.

原文逐語（pinned, 一字一句改変なし）:
  「合併により被合併法人の株主等に交付された合併後存続する法人の株式又は出資に係る資本の金額又は出資金額（被合併法人が二以上ある場合には、各被合併法人に係るこれらの金額のうち最も多い金額）」

This is the LOCAL-corporation-tax parallel of the 法人税法 provision pinned as
law 404CO0000000089 art. 2 (modelled separately as MergerMaxCapital). The
normative text is identical, but this is a DISTINCT law and revision and is
therefore an independent normative unit with its own model and own spec. No
identifier from the 法人税法 model is imported or reused here.

Norm modelled: an explicit MAX-SELECTION among merged corporations — when there
are two or more 被合併法人, the applicable capital/contribution amount is the
LARGEST of the individual amounts. This is a selection norm, not a threshold,
a cap, or a ratio.

Variable contract:
  `n : Nat` = 被合併法人の数 (number of merged corporations), unit 法人.
  `a : Nat`, `b : Nat` = 各被合併法人の資本の金額／出資金額 (capital/contribution
    amounts of individual merged corporations), unit 円.
  `multiCorpThreshold : Nat := 2` = 二 (2 or more).
  `hasMultipleCorps n := decide (multiCorpThreshold <= n)` — 「二以上」 is
    INCLUSIVE: n = 2 triggers, n = 1 does not.
  `maxAmount a b := if a >= b then a else b` — select the larger amount;
    this binary comparison is the core of 「最も多い金額」 for two corporations.

Scope: ONLY the explicit max-selection trigger and comparison in the needle.
Not modelled: the merger procedure, stock/contribution delivery, the selection
of the 基準法人, or any other paragraph, item, or article. No `sorry`, `admit`,
`axiom`, `Classical.choice`, `by_cases`, `omega`, `Monotone`, or struct literals
are used.
-/

namespace JapanTaxLaw.LocalCorpMaxCapital

/-- 二 = 2 merged corporations; inclusive trigger for 「被合併法人が二以上」. -/
def multiCorpThreshold : Nat := 2

/-- 「被合併法人が二以上ある場合」: n >= 2 (以上 = inclusive >=). -/
def hasMultipleCorps (n : Nat) : Bool :=
  decide (multiCorpThreshold <= n)

/-- 「各被合併法人に係るこれらの金額のうち最も多い金額」: the larger of two amounts. -/
def maxAmount (a : Nat) (b : Nat) : Nat :=
  if a >= b then a else b

/-- The statutory numeral is exactly 二 = 2. -/
theorem threshold_value : multiCorpThreshold = 2 := rfl

/-- One merged corporation does not trigger the max-selection rule. -/
theorem one_false : hasMultipleCorps 1 = false := by decide

/-- Exactly two merged corporations trigger the rule (二以上 is inclusive). -/
theorem two_true : hasMultipleCorps 2 = true := by decide

/-- Three merged corporations trigger the rule. -/
theorem three_true : hasMultipleCorps 3 = true := by decide

/-- Larger first argument is selected. -/
theorem max_5_3 : maxAmount 5 3 = 5 := by decide

/-- Larger second argument is selected. -/
theorem max_3_5 : maxAmount 3 5 = 5 := by decide

/-- Equal amounts return that amount. -/
theorem max_4_4 : maxAmount 4 4 = 4 := by decide

/-- Zero amounts return zero. -/
theorem max_0_0 : maxAmount 0 0 = 0 := by decide

end JapanTaxLaw.LocalCorpMaxCapital
