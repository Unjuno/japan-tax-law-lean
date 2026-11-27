import JapanTaxLaw.TaxFinance

/-!
# ReconstructionSpecialIncomeTaxEnforcementDate — 復興特別所得税に関する政令 施行日（附則 art.1）bounded L4 モデル

Historical source (NOT a CurrentEnforced pin):
  Source law: 424CO0000000016
  Source revision: 424CO0000000016_20260525_507CO0000000244
  Source raw snapshot: data/raw/424CO0000000016_20260525_507CO0000000244.law.json
  INVENTORY.json classifies this law as historical_fallback / PreviousEnforced
  (audit_ready=false) because a later revision is UnEnforced (2027-01-01).
  The historical provenance is retained but is deliberately not registered as
  a current revision pin; the cross-law L1<->L3 check therefore lists this
  module as unpinned rather than treating a historical revision as current.
  附則 Article 1 (施行期日). Needles contain no U+3000.

  Why unpinned: INVENTORY records this law's selection_status as
  historical_fallback and its current_revision_status as PreviousEnforced —
  there is no CurrentEnforced revision to pin. cross_law.py correctly requires
  a CurrentEnforced ledger entry for every verification pin, so this module
  deliberately carries no law-id, revision or raw-snapshot-sha256 pin marker.
  It is a historical-reference model, NOT counted as source-verified. The
  separate L1 transcription check still audits its literal against the pinned
  historical snapshot; it does not assert current-law applicability.

原文逐語（附則）:
  「第一条 この政令は、平成二十八年一月一日から施行する。」

Computation（原文逐語から導出、施行日の算定のみ）:
  平成 28 年 = 1988 + 28 = 2016（平成元年 = 1989、1989+28-1=2016）
  enforcementDate = (2016, 1, 1)
  inForce(d) = dateKey(d) >= 20160101

Scope / NOT MODELLED:
  - 同条のただし書「次の各号に掲げる規定は、当該各号に定める日から施行する」は NOT MODELLED（各号ごとの施行日を本モデルでは扱わない）。
    inForce は政令全体の施行日（2016-01-01）のみを表す。
  - 附則の他条（経過措置等）・政令の実体規定（復興特別所得税の税率・申告等）は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.ReconstructionSpecialIncomeTaxEnforcementDate

open JapanTaxLaw.TaxFinance

def heiseiToSeireki (heiseiYear : Nat) : Nat := 1988 + heiseiYear

/-- 施行日 = 平成28年1月1日 = 2016-01-01。 -/
def enforcementDate : Nat × Nat × Nat := (heiseiToSeireki 28, 1, 1)

def dateKey (d : Nat × Nat × Nat) : Nat := d.1 * 10000 + d.2.1 * 100 + d.2.2

def enforcementKey : Nat := dateKey enforcementDate

/-- 指定日が施行日以降か。 -/
def inForce (d : Nat × Nat × Nat) : Bool := dateKey d >= enforcementKey

example : heiseiToSeireki 28 = 2016 := by decide
example : enforcementDate = (2016, 1, 1) := by decide
example : enforcementKey = 20160101 := by decide
example : inForce (2015, 12, 31) = false := by decide
example : inForce (2016, 1, 1) = true := by decide

end JapanTaxLaw.ReconstructionSpecialIncomeTaxEnforcementDate
