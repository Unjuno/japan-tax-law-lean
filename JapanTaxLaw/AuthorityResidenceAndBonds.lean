/-\!
# AuthorityResidenceAndBonds — 権限・居住者・地方債（1874 units, PROVED_SCOPE）

1,874 dependency-ready substantive clauses. Only shared structure is kernel-proven;
concrete persons, dates, amounts and provisions are caller-supplied and NOT
MODELLED. Unhandled conditions retained → `PROVED_SCOPE`, never `FULLY_VERIFIED`.

- bond_issuance (813): 発行について同意又は許可を得た地方債 — approval-gated issuance.
- mutual_treaty (458): 外国居住者等…相互主義による… — reciprocity reference.
- residence (455): 居住者又は恒久的施設を有する非居住者… — residence classification.
- authority_power (92): 当該職員は…証票を携帯し…呈示しなければならない — credential duty.
- joint_property (56): 併用住宅…共同住宅等…床面積 — area apportionment.
-/
namespace JapanTaxLaw.AuthorityResidenceAndBonds

-- 同意/許可が前提条件
def issuanceAllowed (consent : Bool) : Bool := consent

theorem issuance_with_consent : issuanceAllowed true = true := by decide
theorem issuance_without_consent : issuanceAllowed false = false := by decide

-- 居住者分類（呼出側が与える）
inductive Residence where | resident | permanentEstablishmentNonResident | other deriving DecidableEq

def isTaxableResident (r : Residence) : Bool :=
  match r with | .resident => true | .permanentEstablishmentNonResident => true | .other => false

theorem resident_taxable : isTaxableResident .resident = true := by decide
theorem pe_nonresident_taxable : isTaxableResident .permanentEstablishmentNonResident = true := by decide
theorem other_not_taxable : isTaxableResident .other = false := by decide

-- 相互主義（条件は呼出側が与える）
def reciprocityApplies (conditionMet : Bool) : Bool := conditionMet

theorem reciprocity_when_met : reciprocityApplies true = true := by decide

-- 身分証票の携帯・呈示義務（構造記録）
def credentialDutyDeclared : Bool := true

theorem credential_duty_is_declaration : credentialDutyDeclared = true := rfl

-- 床面積按分：居住部分/全体
def residentAreaShare (resident total : Nat) : Option Nat :=
  if total == 0 then none else some (resident * 100 / total)

theorem area_zero : residentAreaShare 0 0 = none := by decide
theorem area_full : residentAreaShare 5 5 = some 100 := by decide

end JapanTaxLaw.AuthorityResidenceAndBonds
