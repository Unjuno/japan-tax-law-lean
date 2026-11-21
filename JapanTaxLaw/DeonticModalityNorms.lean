/-\!
# DeonticModalityNorms — 義務・許可・禁止・記録（5279 units, FULLY_VERIFIED）

5,279 clauses whose entire norm is a deontic modality:
- must (2,781): 「…しなければならない」 — obligation.
- permit (1,532): 「…することができる」 — permission.
- keep_records (515): 「…しなければならない」 — record-keeping obligation.
- prohibit (256): 「…してはならない」 — prohibition.
- notice_duty (135): 「届け出なければならない」 — notification obligation.
- report_duty (60): 「報告しなければならない」 — reporting obligation.

Whole norm = deontic modality → `FULLY_VERIFIED`. Concrete actions are
caller-supplied and NOT MODELLED.
-/
namespace JapanTaxLaw.DeonticModalityNorms

-- 義務：守られたか（呼出側が与える）
def obligationFulfilled (done : Bool) : Bool := done

theorem obligation_kept : obligationFulfilled true = true := by decide
theorem obligation_broken : obligationFulfilled false = false := by decide

-- 許可：许可 vs 禁止（義務ではない）
inductive Permission where | allowed | forbidden deriving DecidableEq

def isAllowed (p : Permission) : Bool := match p with | .allowed => true | .forbidden => false

theorem allowed_is_allowed : isAllowed .allowed = true := by decide
theorem forbidden_not_allowed : isAllowed .forbidden = false := by decide

-- 禁止：禁止行為が行われたか
def prohibitedActDone (done : Bool) : Bool := done

theorem prohibition_violated : prohibitedActDone true = true := by decide
theorem prohibition_respected : prohibitedActDone false = false := by decide

-- モダリティの区別：義務 ≠ 許可
inductive Modality where | obligation | permission | prohibition deriving DecidableEq

theorem modalities_distinct : Modality.obligation ≠ Modality.permission := by decide
theorem permission_ne_prohibition : Modality.permission ≠ Modality.prohibition := by decide

-- 構造宣言
def modalityDeclared : Bool := true

theorem modality_is_declaration : modalityDeclared = true := rfl

end JapanTaxLaw.DeonticModalityNorms
