import JapanTaxLaw.StampTable

/-!
# StampTable spec — independent statement of 別表第一 第一〜三号

Source (pinned):
  Law id: 342AC0000000023
  Revision: 342AC0000000023_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 263FCDCBC229A04485B175191CB18F248A9F3E756F3C55FA8E27206ECFC8D02F

Independent restatement of 印紙税法 別表第一 第一号・第二号・第三号 (tax-rate tables for
契約書・請負契約書・手形) from the statutory text itself. Where the implementation uses
if/elif chains, this spec computes the rate by direct band selection: the amount's band
is found by an explicit nested-if search written against the statutory bracket list, so
the two derivations disagree on paper — they agree in cost.

Scope boundaries are identical to the implementation (see StampTable.lean): 別表第一の
通則・記載金額の評価・第四号以降はモデル化しない。収入印紙の貼付・消印・納付方法は射程外。
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec helper: a (inclusive cap → duty) band list per art. 別表第一. -/
def specContractBands : List (Money × Money) :=
  [(100_000, 200), (500_000, 400), (1_000_000, 1_000), (5_000_000, 2_000),
   (10_000_000, 10_000), (50_000_000, 20_000), (100_000_000, 60_000),
   (500_000_000, 100_000), (1_000_000_000, 200_000), (5_000_000_000, 400_000)]

def specWorkContractBands : List (Money × Money) :=
  [(1_000_000, 200), (2_000_000, 400), (3_000_000, 1_000), (5_000_000, 2_000),
   (10_000_000, 10_000), (50_000_000, 20_000), (100_000_000, 60_000),
   (500_000_000, 100_000), (1_000_000_000, 200_000), (5_000_000_000, 400_000)]

def specNoteBands : List (Money × Money) :=
  [(1_000_000, 200), (2_000_000, 400), (3_000_000, 600), (5_000_000, 1_000),
   (10_000_000, 2_000), (20_000_000, 4_000), (30_000_000, 6_000), (50_000_000, 10_000),
   (100_000_000, 20_000), (200_000_000, 40_000), (300_000_000, 60_000), (500_000_000, 100_000),
   (1_000_000_000, 150_000)]

/-- Spec helper: select the first (cap, duty) band covering `amount`; `top` is the
    open-ended rate above the last band. An independent algorithm from the implementation. -/
def specDutyOfTable (bands : List (Money × Money)) (top : Money) (amount : Money) : Money :=
  match bands.find? (fun (cap, _) => amount ≤ cap) with
  | some (_, duty) => duty
  | none => top

/-- Spec: 第一号文書の段階税率. -/
def specContractStampDuty (amount : Money) : Money := specDutyOfTable specContractBands 600_000 amount

/-- Spec: 第二号文書の段階税率. -/
def specWorkContractStampDuty (amount : Money) : Money := specDutyOfTable specWorkContractBands 600_000 amount

/-- Spec: 第三号文書の段階税率. -/
def specNoteStampDuty (amount : Money) : Money := specDutyOfTable specNoteBands 200_000 amount

/-- Spec: 税額 — direct match, no shared code path. -/
def specStampDuty (d : StampDocument) : Money :=
  match d.kind with
  | .contract =>
      match d.statedAmount with
      | none => 200
      | some a => if a < 10_000 then 0 else specContractStampDuty a
  | .contractOfWork =>
      match d.statedAmount with
      | none => 200
      | some a => if a < 10_000 then 0 else specWorkContractStampDuty a
  | .note =>
      if d.isPreferredNote then 200
      else
        match d.statedAmount with
        | none => 0
        | some a => if a < 100_000 then 0 else specNoteStampDuty a

-- ==== points, all kernel-decided ====

-- 第一号: each band edge (inclusive cap)
example : specContractStampDuty 0 = 200 := by decide
example : specContractStampDuty 100_000 = 200 := by decide
example : specContractStampDuty 100_001 = 400 := by decide
example : specContractStampDuty 500_000 = 400 := by decide
example : specContractStampDuty 500_001 = 1_000 := by decide
example : specContractStampDuty 10_000_000 = 10_000 := by decide
example : specContractStampDuty 50_000_000 = 20_000 := by decide
example : specContractStampDuty 1_000_000_000 = 200_000 := by decide
example : specContractStampDuty 5_000_000_000 = 400_000 := by decide
example : specContractStampDuty 5_000_000_001 = 600_000 := by decide

-- 第二号: each band edge
example : specWorkContractStampDuty 1_000_000 = 200 := by decide
example : specWorkContractStampDuty 1_000_001 = 400 := by decide
example : specWorkContractStampDuty 5_000_000 = 2_000 := by decide
example : specWorkContractStampDuty 50_000_000 = 20_000 := by decide
example : specWorkContractStampDuty 5_000_000_000 = 400_000 := by decide
example : specWorkContractStampDuty 5_000_000_001 = 600_000 := by decide

-- 第三号: each band edge
example : specNoteStampDuty 1_000_000 = 200 := by decide
example : specNoteStampDuty 1_000_001 = 400 := by decide
example : specNoteStampDuty 5_000_000 = 1_000 := by decide
example : specNoteStampDuty 10_000_000 = 2_000 := by decide
example : specNoteStampDuty 30_000_000 = 6_000 := by decide
example : specNoteStampDuty 100_000_000 = 20_000 := by decide
example : specNoteStampDuty 1_000_000_000 = 150_000 := by decide
example : specNoteStampDuty 1_000_000_001 = 200_000 := by decide

/-- Spot-check: implementation agrees with the independent spec at sample points
    covering every band of every table and each unstated/non-taxable branch.
    Points are sample points, not a proof of universal equivalence. -/
def agreeStampTablePoints : Bool :=
  let c := contractStampDuty
  let w := workContractStampDuty
  let n := noteStampDuty
  (c 100_000 == specContractStampDuty 100_000) &&
  (c 100_001 == specContractStampDuty 100_001) &&
  (c 500_000 == specContractStampDuty 500_000) &&
  (c 1_000_000 == specContractStampDuty 1_000_000) &&
  (c 5_000_000 == specContractStampDuty 5_000_000) &&
  (c 10_000_000 == specContractStampDuty 10_000_000) &&
  (c 50_000_000 == specContractStampDuty 50_000_000) &&
  (c 100_000_000 == specContractStampDuty 100_000_000) &&
  (c 500_000_000 == specContractStampDuty 500_000_000) &&
  (c 1_000_000_000 == specContractStampDuty 1_000_000_000) &&
  (c 5_000_000_000 == specContractStampDuty 5_000_000_000) &&
  (c 5_000_000_001 == specContractStampDuty 5_000_000_001) &&
  (w 1_000_000 == specWorkContractStampDuty 1_000_000) &&
  (w 2_000_000 == specWorkContractStampDuty 2_000_000) &&
  (w 3_000_000 == specWorkContractStampDuty 3_000_000) &&
  (w 5_000_000 == specWorkContractStampDuty 5_000_000) &&
  (w 10_000_000 == specWorkContractStampDuty 10_000_000) &&
  (w 50_000_000 == specWorkContractStampDuty 50_000_000) &&
  (w 100_000_000 == specWorkContractStampDuty 100_000_000) &&
  (w 500_000_000 == specWorkContractStampDuty 500_000_000) &&
  (w 1_000_000_000 == specWorkContractStampDuty 1_000_000_000) &&
  (w 5_000_000_000 == specWorkContractStampDuty 5_000_000_000) &&
  (w 5_000_000_001 == specWorkContractStampDuty 5_000_000_001) &&
  (n 1_000_000 == specNoteStampDuty 1_000_000) &&
  (n 2_000_000 == specNoteStampDuty 2_000_000) &&
  (n 3_000_000 == specNoteStampDuty 3_000_000) &&
  (n 5_000_000 == specNoteStampDuty 5_000_000) &&
  (n 10_000_000 == specNoteStampDuty 10_000_000) &&
  (n 20_000_000 == specNoteStampDuty 20_000_000) &&
  (n 30_000_000 == specNoteStampDuty 30_000_000) &&
  (n 50_000_000 == specNoteStampDuty 50_000_000) &&
  (n 100_000_000 == specNoteStampDuty 100_000_000) &&
  (n 200_000_000 == specNoteStampDuty 200_000_000) &&
  (n 300_000_000 == specNoteStampDuty 300_000_000) &&
  (n 500_000_000 == specNoteStampDuty 500_000_000) &&
  (n 1_000_000_000 == specNoteStampDuty 1_000_000_000) &&
  (n 1_000_000_001 == specNoteStampDuty 1_000_000_001) &&
  (stampDuty ⟨.contract, none, false⟩ == specStampDuty ⟨.contract, none, false⟩) &&
  (stampDuty ⟨.contractOfWork, none, false⟩ == specStampDuty ⟨.contractOfWork, none, false⟩) &&
  (stampDuty ⟨.note, none, false⟩ == specStampDuty ⟨.note, none, false⟩) &&
  (stampDuty ⟨.note, some 500_000, true⟩ == specStampDuty ⟨.note, some 500_000, true⟩) &&
  (stampDuty ⟨.contract, some 9_999, false⟩ == specStampDuty ⟨.contract, some 9_999, false⟩) &&
  (stampDuty ⟨.note, some 99_999, false⟩ == specStampDuty ⟨.note, some 99_999, false⟩)

example : agreeStampTablePoints = true := by decide

end JapanTaxLaw
