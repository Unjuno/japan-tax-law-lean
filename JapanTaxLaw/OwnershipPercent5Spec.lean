import JapanTaxLaw.OwnershipPercent5

/-
# OwnershipPercent5Spec — independent spec for 租税特別措置法施行令 第一条の八

Pinned source:
  Law id: 329CO0000000155
  Revision: 329CO0000000155_20260401_508CO0000000085
  Raw snapshot: data/raw/329CO0000000155_20260401_508CO0000000085.law.json
  sha256: 7f76960b6510a6bd086c236c7d7facf5e47cb276f24a3f4a705c0c0aa8e15d01
  Statutory article: 第一条の八 (art. 1の8; raw JSON Article attr.Num = "1_8")

原文逐語: 「いずれか一方の者が他方の者の事業に係る議決権を伴う社外株式の総数の五パーセント以上の社外株式を直接又は間接に所有し、管理し、又は所持している場合」

INDEPENDENT FORMULATION. This module owns its own statutory percentage
constant `specThreshold : Nat := 5` and its own predicate
`specMeets (percent : Nat) : Bool := decide (specThreshold <= percent)`.
No implementation identifier (ownershipThresholdPercent /
meetsOwnershipThreshold) occurs in any spec* definition body. The only links
are the kernel-checked bridges agreeThreshold / agreeMeets, which are plain
`unfold ... ; rfl` proofs. Out of scope, as in the impl: 議決権, 社外株式,
直接又は間接, 所有・管理・所持 and all non-numeric art. 1の8 language.
-/

namespace JapanTaxLaw.OwnershipPercent5

/-- Independent 五パーセント ownership threshold = 5 (percentage points). -/
def specThreshold : Nat := 5

/-- Independent 五パーセント以上 predicate: percent >= 5, INCLUSIVE. -/
def specMeets (percent : Nat) : Bool :=
  decide (specThreshold <= percent)

theorem agreeThreshold : ownershipThresholdPercent = specThreshold := by
  unfold ownershipThresholdPercent specThreshold; rfl

theorem agreeMeets (percent : Nat) : meetsOwnershipThreshold percent = specMeets percent := by
  unfold meetsOwnershipThreshold specMeets ownershipThresholdPercent specThreshold
  rfl

end JapanTaxLaw.OwnershipPercent5
