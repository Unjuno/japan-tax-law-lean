import JapanTaxLaw.RegistrationTaxTruncation30k

/-
# RegistrationTaxTruncation30kSpec — 登録免許税法施行令 第二十九条 の独立整数定式

Pinned source:
  Law id: 342CO0000000146
  Revision: 342CO0000000146_20261001_507CO0000000124 (current-enforced)
  Raw snapshot: data/raw/342CO0000000146_20261001_507CO0000000124.law.json
  sha256: 0fc3f9ca8c85fa0dbafec4de836a9c1cbf7153c01e58f01b25995aa29ec9aa2b
  Article: 第二十九条 (raw JSON Article attr.Num = "29")
  原文逐語: 「登記等につき課されるべき登録免許税の額の三万円未満の端数の部分の登録免許税を納付する場合」

INDEPENDENT FORMULATION. This module carries its OWN statutory constant
`specUnit : Nat := 30_000` (三万円 = 3 × 10^4 円) and expresses the 角捨て rule
with the SAME modulo/subtraction operator on that own constant:
  `specTruncate amount := amount - amount % specUnit`.
No implementation identifier (`truncUnit`, `truncate30k`) occurs in any
independent `spec*` formula. The ONLY impl/spec bridge is the universal
kernel-checked theorem `agreeTruncate`, proved by pure `unfold ... ; rfl`:
after unfolding, both sides are definitionally identical terms. There is no
`by_cases`, no `omega`, no `Classical.choice` and no extra axiom.

Variable contract: amount = 登録免許税の額 (Nat, unit 円); 三万円未満の端数 =
  amount % 30_000 (< 30_000); truncation is DOWN (角捨て).
Not modelled (same as the implementation): 印紙納付の該当性・公示・認定,
  other paragraphs/articles, supplementary provisions, legal determination.
-/

namespace JapanTaxLaw.RegistrationTaxTruncation30k

/-- Spec-local statutory constant: 三万円 = 30,000 (円, Nat). Independent of impl. -/
def specUnit : Nat := 30_000

/-- Independent 「三万円未満の端数を角捨て」: amount - amount % specUnit. -/
def specTruncate (amount : Nat) : Nat :=
  amount - amount % specUnit

/-- Universal, kernel-checked correspondence for every Nat amount.
    Pure axiom-free bridge: unfolding both constants leaves definitionally
    identical terms, so `rfl` closes it. No by_cases / omega /
    Classical.choice / extra axiom. -/
theorem agreeTruncate (amount : Nat) : truncate30k amount = specTruncate amount := by
  unfold truncate30k specTruncate truncUnit specUnit
  rfl

-- Spec-local, kernel-decided spot-checks (independent of the implementation).
example : specUnit = 30_000 := by decide
example : specTruncate 0 = 0 := by decide
example : specTruncate 29999 = 0 := by decide
example : specTruncate 30000 = 30000 := by decide
example : specTruncate 30001 = 30000 := by decide
example : specTruncate 45000 = 30000 := by decide
example : specTruncate 60000 = 60000 := by decide

end JapanTaxLaw.RegistrationTaxTruncation30k
