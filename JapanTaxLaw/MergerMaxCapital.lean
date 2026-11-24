import JapanTaxLaw.TaxFinance

/-
# MergerMaxCapital — 法人税法 第二条（合併資本金額の最大額選択）

Pinned source:
  Law id: 404CO0000000089
  Revision: 404CO0000000089_20010106_412CO0000000307
  Raw snapshot: data/raw/404CO0000000089_20010106_412CO0000000307.law.json
  sha256: e80aec82d08862cb6ae5611886e5d844624473d18936c6fd67ce9cc26ed68ab1
  Statutory article: 第二条 (art. 2; raw JSON Article attr.Num = "2").

原文逐語（pinned, 一字一句改変なし）:
  「合併により被合併法人の株主等に交付された合併後存続する法人の株式又は出資に係る資本の金額又は出資金額（被合併法人が二以上ある場合には、各被合併法人に係るこれらの金額のうち最も多い金額）」

Norm modelled: an explicit MAX-SELECTION among merged corporations — when there
are two or more 被合併法人, the applicable capital amount is the LARGEST of the
individual amounts. This is a selection norm, distinct from a threshold, cap,
or ratio.

Variable contract:
  `n : Nat` = 被合併法人の数 (number of merged corporations), unit 法人.
  `a : Nat`, `b : Nat` = 各被合併法人の資本の金額／出資金額 (capital/contribution
    amounts of individual merged corporations), unit 円.
  `multiCorpThreshold : Nat := 2` = 二 (2 or more).
  `hasMultipleCorps n := decide (multiCorpThreshold <= n)` — 「二以上」 is
    INCLUSIVE: n = 2 triggers, n = 1 does not.
  `maxAmount a b := if a >= b then a else b` — select the larger amount.
    This binary comparison is the core of 「最も多い金額」 for two corporations.

Scope: ONLY the explicit max-selection trigger and comparison in the needle.
Not modelled: the merger procedure, stock/contribution delivery, or any other
paragraph or article. No `sorry`, `admit`, `axiom`, `Classical.choice`,
`by_cases`, `omega`, `Monotone`, or struct literals are used.
-/

namespace JapanTaxLaw.MergerMaxCapital

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

end JapanTaxLaw.MergerMaxCapital
