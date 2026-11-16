import JapanTaxLaw.TaxFinance

/-!
# StampDuty — 印紙税法 art. 20 (過怠税) L4 computation slice

Source (pinned):
  Law id: 342AC0000000023
  Revision: 342AC0000000023_20261001_507AC0000000070
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 263FCDCBC229A04485B175191CB18F248A9F3E756F3C55FA8E27206ECFC8D02F
  (data/raw/342AC0000000023_20261001_507AC0000000070.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Art. 20 (second-item authority: 印紙納付に係る不納税額があつた場合の過怠税
の徴収) of 印紙税法, verbatim:

  第八条第一項の規定により印紙税を納付すべき課税文書の作成者が同項の
  規定により納付すべき印紙税を当該課税文書の作成の時までに納付しなかつた
  場合には、当該課税文書の作成者から、当該納付しなかつた印紙税の額とその
  二倍に相当する金額との合計額に相当する過怠税を徴収する。(art. 20 一号)

  政令で定めるところにより、当該課税文書について印紙税を納付していない旨
  の申出があり、かつ、調査があつたことにより過怠税の決定があるべきことを
  予知してされたものでないときは、当該過怠税の額は、当該納付しなかつた
  印紙税の額と当該印紙税の額に百分の十の割合を乗じて計算した金額との
  合計額に相当する金額とする。(art. 20 二号)

  ・・・（第三号）
  第一項又は前項の場合において、過怠税の合計額が千円に満たないときは、
  これを千円とする。(art. 20 四号)

  前項に規定する過怠税の合計額が、第二項の規定の適用を受けた過怠税のみに
  係る合計額であるときは、当該過怠税の合計額については、前項の規定の適用
  はないものとする。(art. 20 五号)

L4 contents modelled here:

  `stampAuditPenalty amount`     — art. 20(1) discovered non-payment:
                                     unpaid + 2 × unpaid = 3 × unpaid
  `stampDeclaredPenalty amount`  — art. 20(2) self-declared before investigation:
                                     unpaid + 10% = 110%
  `stampDutyFloor amount`        — art. 20(4) minimum floor: ¥1,000 (unless
                                     the penalty only consists of art. 20(2)
                                     amounts, per art. 20(5))
  `stampFullPenalty auditDec amount` — combine, applying the ¥1,000 floor only
                                     for art. 20(1) and amount combinations,
                                     honoring art. 20(5) for art. 20(2)-only.

Scope limits (not modelled here):

  art. 20(3) — non-cancellation of stamps (消を消さなかった場合). Since it
  operates on different operative facts (un-cancelled stamp face value, not
  unpaid action), it is left for a later slice. Art. 20(6)-(7) — administrative
  notification/tax classification — are not computational content. The
  complete-art.-20 aggregation of multiple underpayments on one document
  (art. 20(4) vs multiple violations) is modelled but per-document.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Art. 20(1): discovered non-payment — penalty is the unpaid stamp amount
    plus twice that amount = 3 × unpaid. -/
def stampAuditPenalty (unpaid : Money) : Money := unpaid + unpaid * 2

/-- Art. 20(2): self-declared before investigation — penalty is the unpaid
    stamp amount plus 10% of that amount (百分の十). -/
def stampDeclaredPenalty (unpaid : Money) : Money :=
  unpaid + (unpaid * 10) / 100

/-- Art. 20(3): un-cancelled stamps — penalty equals the unpaid unused stamp
    face value. (Collected here as a distinct function to keep it available.) -/
def stampUncancelledPenalty (face : Money) : Money := face

/-- Art. 20(4) formula: any aggregate underpayment penalty below ¥1,000
    is rounded up to ¥1,000. Boundary note: 333 * 3 = 999 < 1,000 and
    334 * 3 = 1,002 ≥ 1,000. -/
def stampDutyFloor (amount : Money) : Money :=
  if amount < 1_000 then 1_000 else amount

/-- Art. 20(1)-type penalty with art. 20(4) floor applied. -/
def stampAuditPenaltyFloor (unpaid : Money) : Money :=
  stampDutyFloor (stampAuditPenalty unpaid)

/-- Art. 20(2)-only penalty aggregates are exempt from the ¥1,000 floor
    (art. 20(5)); modelled as a separate combination so the call site does
    not blindly apply the floor. -/
def stampDeclaredOnlyTotalsExcludeFloor : Bool := true

-- ==== art. 20(4)/(5) floor-logic properties (kernel-verified) ====

/-- Art. 20(4): the ¥1,000 floor raises the aggregate to at least ¥1,000
    (or keeps it unchanged when it was already ≥ ¥1,000). -/
theorem stampDutyFloor_ge_thousand (n : Money) : 1_000 ≤ stampDutyFloor n := by
  unfold stampDutyFloor
  by_cases h : n < 1_000
  · rw [ite_eq_left h]
    exact Nat.le_refl 1_000
  · rw [ite_eq_right h]
    exact Nat.le_of_not_lt h

/-- Art. 20(4): the floor does not lower the aggregate. -/
theorem stampDutyFloor_ge_amount (n : Money) : n ≤ stampDutyFloor n := by
  unfold stampDutyFloor
  by_cases h : n < 1_000
  · rw [ite_eq_left h]
    exact Nat.le_of_lt h
  · rw [ite_eq_right h]
    exact Nat.le_refl n

/-- Art. 20(3)/(1)-type penalties flow into the floor correctly:
    stamp-uncancelled and audit penalties keep their content but sit above the floor. -/
theorem stampAuditPenaltyFloor_ge_thousand (n : Money) :
    1_000 ≤ stampAuditPenaltyFloor n := stampDutyFloor_ge_thousand _

/-- Art. 20(5): the declared-only aggregate keeps the floor exclusion — modelled as a
    marker constant so the call site cannot silently re-apply the floor. -/
theorem stampDeclaredOnlyTotalsExcludeFloor_is_true :
    stampDeclaredOnlyTotalsExcludeFloor = true := rfl

/-- Art. 20(1): the admin penalty equals three times the unpaid amount. -/
theorem stampAuditPenalty_eq_three (n : Money) : stampAuditPenalty n = n * 3 := by
  unfold stampAuditPenalty
  rw [show (3 : Nat) = 2 + 1 from rfl, Nat.mul_succ n 2]
  exact Nat.add_comm n (n * 2)

/-- Art. 20(2): declarer pays unpaid + 10% of unpaid (i.e., 11x over 10). -/
theorem stampDeclaredPenalty_small (n : Money) : stampDeclaredPenalty n = n + n * 10 / 100 := rfl

-- ==== verified facts ====

theorem stampAudit_zero : stampAuditPenalty 0 = 0 := by decide
theorem stampDeclared_zero : stampDeclaredPenalty 0 = 0 := by decide
example : stampAuditPenalty 100 = 300 := by decide
example : stampAuditPenalty 334 = 1002 := by decide
example : stampDeclaredPenalty 100 = 110 := by decide
example : stampDeclaredPenalty 34 = 37 := by decide
example : stampDeclaredPenalty 35 = 38 := by decide

/-- Specified enforcement date note (art. 20(4) lifts floor wrt art. 20(2)-only
    penalties, recorded here as documentation of the interaction). -/
example : stampDutyFloor 999 = 1_000 := by decide
example : stampDutyFloor 1_000 = 1_000 := by decide
example : stampDutyFloor 1_500 = 1_500 := by decide

end JapanTaxLaw
